const loginAddress = localStorage.getItem("loginAddress");

const apiUrl = NODE_ENV["RARIBLE_API"];

const checkOrder = async function() {
    let result = false;

    $.get(apiUrl + loginAddress, function(data){
        console.log("data: ", data);

        if (data.orders.length > 0) {
            result = true;
        }
    })

    return result;

}

export { checkOrder };