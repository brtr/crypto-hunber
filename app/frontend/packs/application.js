require("@rails/ujs").start();
require("turbolinks").start();
require("jquery");
require("trix");
require("@rails/actiontext");

import 'bootstrap/dist/js/bootstrap';
import "bootstrap/dist/css/bootstrap";
import Tagify from '@yaireo/tagify';
import { checkContract } from './sunflower';
import { checkOpensea } from './opensea';
import { checkSushiSwap } from './sushiswap';
import { checkUniSwap } from './uniswap';
import { checkTradeJoe } from './tradejoe';
import { checkPangolin } from './pangolin';
import { checkSpookySwap } from './spookyswap';
import { checkLido } from './lido';
import { checkENS, getENS } from './moralis';

let loginAddress = localStorage.getItem("loginAddress");
const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

function replaceChar(origString, firstIdx, lastIdx, replaceChar) {
    let firstPart = origString.substr(0, firstIdx);
    let lastPart = origString.substr(lastIdx);

    let newString = firstPart + replaceChar + lastPart;
    return newString;
}

const fetchErrMsg = function(err) {
    const errMsg = err.error ? err.error.message : err.message;
    alert('Error:  ' + errMsg.split(": ")[1]);
    $("#spinner").addClass("hide");
}

const toggleAddress = function() {
    if(loginAddress) {
        $("#login_address").text(replaceChar(loginAddress, 6, -4, "..."));
        $(".loginBtns .navbar-tool").removeClass("hide");
        $(".loginBtns .btn").addClass("hide");
        $(".actions").removeClass("hide");
    } else {
        $(".actions").addClass("hide");
        $(".loginBtns .navbar-tool").addClass("hide");
        $(".loginBtns .btn").removeClass("hide");
    }
}

const checkLogin = async function() {
    $("#spinner").removeClass("hide");
    const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
    if (accounts.length > 0) {
        localStorage.setItem("loginAddress", accounts[0]);
        loginAddress = accounts[0];
        login();
    } else {
        localStorage.removeItem("loginAddress");
        loginAddress = null;
        toggleAddress();
    }
}

const login = function() {
    $.ajax({
        url: "/login",
        method: "post",
        data: { address: loginAddress }
    }).done(function(data) {
        if (data.success) {
            location.reload();
        }
    })
}

const checkOffer = async function(offerName) {
    let result = false;

    try {
        console.log(offerName);
        switch(offerName) {
            case "SunFlower":
                result = await checkContract();
                break;
            case "Opensea":
                result = await checkOpensea();
                break;
            case "Sushiswap":
                result = await checkSushiSwap();
                break;
            case "ENS":
                result = await checkENS();
                break;
            case "Uniswap":
                result = await checkUniSwap();
                break;
            case "TradeJoe":
                result = await checkTradeJoe();
                break;
            case "Pangolin":
                result = await checkPangolin();
                break;
            case "Spookyswap":
                result = await checkSpookySwap();
                break;
            case "Lido":
                result = await checkLido();
                break;
            default:
                result
        }

        console.log("Result: ", result);
        return result;
    } catch (err) {
        fetchErrMsg(err);
    }
}

const complete = function(offerId) {
    try {
        const url = "/offers/" + offerId + "/complete";
        const $form = $('<form action="' + url + '" method="post">' +
            '<input type="hidden" name="authenticity_token" value="' + token + '" />' +
            '<input type="hidden" name="_method" value="put" /></form>');
        $('body').append($form);
        $form.submit();
    } catch (err) {
        fetchErrMsg(err);
    }
}

const toggleUserLike = function(projectId) {
    try {
        const url = "/recommend_projects/" + projectId + "/toggle_like";
        $.ajax({
            url: url,
            method: "put"
        }).done(function(data) {
            if (data.success) {
                location.reload();
            }
        })
    } catch (err) {
        fetchErrMsg(err);
    }
}

const fetchEnsName = async function() {
    const name = await getENS();
    if (name) {
        $("#ens").text(name);
        $("#ensBlock").removeClass("hide");
    } else {
        $("#ensBlock").addClass("hide");
    }
}

$(document).on('turbolinks:load', function() {
  'use strict';

    $(function() {
        $('[data-bs-toggle="tooltip"]').tooltip({html: true});

        $("#btn-login").on("click", function(e){
            e.preventDefault();
            console.log("hello");
            checkLogin();
        });

        $("#btn-logout").on("click", function(){
            $("#spinner").removeClass("hide");
            localStorage.removeItem("loginAddress");

            $.ajax({
                url: "/logout",
                method: "post"
            }).done(function(data) {
                if (data.success) {
                    location.reload();
                }
            })
        });

        $(".takeBtn").on("click", function() {
            $("#spinner").removeClass("hide");
        })

        $(".completeBtn").on("click", async function(e) {
            e.preventDefault();
            $("#spinner").removeClass("hide");
            const result = await checkOffer($(this).data("name"));
            if (result) {
                complete($(this).data("id"));
            } else {
                alert("任务未完成不能领取奖励!");
                $("#spinner").addClass("hide");
            }
        })

        $(".likeBtn").on("click", function() {
            $("#spinner").removeClass("hide");
            toggleUserLike($(this).data("id"));
        })

        $(".getDesc").on("click", function(e) {
            e.preventDefault();
            const desc = $(this).data("desc");
            $("#descModal .modal-body p").html(desc.replace(/\n/g, '<br />'));
            $("#descModal").modal("show");
        })

        $(document).on("click", ".closeBtn", function() {
            $("#descModal").modal("hide");
        })

        toggleAddress();

        new Tagify(document.getElementById('recommend_project_tag_list'), {
            originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
        });

        $("#recommend_project_logo").on("change", function(e) {
            const filename = e.target.files[0].name;
            $("#upload_label span").html(filename + "<i class='ai-check me-1 align-vertical'></i>");
        })

        $(document).on("click", ".editOfferBtn", function(e) {
            e.preventDefault();
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            $("#editForm").attr("action", "/offers/" + $(this).data("id"));
            $("#editForm").find("#offer_count").val($(this).data("count"));
            $("#editForm").find("#offer_cost").val($(this).data("cost"));
            $("#editForm").find("#offer_desc").val($(this).data("desc"));
            $("#editForm").find("input[name='authenticity_token']").val(token);
            $("#editOfferModal").modal("show");
        })

        if ($("#userProfile").length > 0) {
            fetchEnsName();
        }

        // detect Metamask account change
        ethereum.on('accountsChanged', function (accounts) {
            console.log('accountsChanges',accounts);
            if (accounts.length > 0) {
                localStorage.setItem("loginAddress", accounts[0]);
                loginAddress = accounts[0];
                login();
            } else {
                localStorage.removeItem("loginAddress");
                loginAddress = null;
                toggleAddress();
            }
        });

        // detect Network account change
        ethereum.on('chainChanged', function(networkId){
            console.log('networkChanged',networkId);
            location.reload();
        });
    });
});