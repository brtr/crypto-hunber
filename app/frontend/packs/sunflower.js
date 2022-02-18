const ethers = require("ethers");
const loginAddress = localStorage.getItem("loginAddress");
const provider = new ethers.providers.Web3Provider(web3.currentProvider);
const TargetChain = {id: NODE_ENV["CHAIN_ID"], name: NODE_ENV["CHAIN_NAME"]};

const contractAddress = NODE_ENV["CONTRACT_ADDRESS"];
const contractABI = NODE_ENV["CONTRACT_ABI"];
const FarmContract = new ethers.Contract(contractAddress, contractABI, provider);

const tokenAddress = NODE_ENV["TOKEN_ADDRESS"];
const tokenABI = NODE_ENV["TOKEN_ABI"];
const TokenContract = new ethers.Contract(tokenAddress, tokenABI, provider);

const checkContract = async function() {
    const { chainId } = await provider.getNetwork();
    if (chainId != parseInt(TargetChain.id)) {
        alert("We don't support this chain, please switch to " + TargetChain.name);
        return false;
    }

    let result = false;
    const farm = await FarmContract.getFarm(loginAddress);
    console.log("farm level: ", farm.length);
    if (farm.length > 5) {
        result = true;
    } else {
        result = false;
    }

    const balance = await TokenContract.balanceOf(loginAddress);
    console.log("token balance: ", balance);
    if (balance > 0) {
        result = true;
    } else {
        result = false;
    }

    return result;
}

export { checkContract };