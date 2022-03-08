const server = NODE_ENV["MORALIS_SERVER"];
const appId = NODE_ENV["MORALIS_APPID"];
Moralis.start({ serverUrl: server, appId: appId });

const loginAddress = localStorage.getItem("loginAddress");

const checkOrder = async function(addresses, chain = "eth") {
    const options = { address: loginAddress, limit: 1000, chain: chain };
    const txs = await Moralis.Web3API.account.getTransactions(options);
    console.log("contract addresses: ", addresses);
    if (txs.total > 0) {
        const result = $.grep(txs.result, function(tx) {
            return tx.from_address == loginAddress && $.inArray(tx.to_address, addresses) >= 0;
        })

        console.log("result: ", result);

        if (result.length > 0) {
            return true;
        }
    }

    return false;

}

const getENS = async function() {
    try {
        const ens = await Moralis.Web3API.resolve.resolveAddress({address: loginAddress});
        return ens.name;
    } catch(err) {
        console.log("error: ", err);
        return "";
    }
}

const checkENS = async function() {
    const ens = await getENS();
    return ens.length > 0
}

export { checkOrder, getENS, checkENS };