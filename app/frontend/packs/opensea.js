const server = NODE_ENV["MORALIS_SERVER"];
const appId = NODE_ENV["MORALIS_APPID"];
Moralis.start({ serverUrl: server, appId: appId });

const openseaAddress = NODE_ENV["OPENSEA_ADDRESS"];
const loginAddress = localStorage.getItem("loginAddress");

const checkOrder = async function() {
    const options = { address: loginAddress, limit: 1000 };
    const txs = await Moralis.Web3API.account.getTransactions(options);

    if (txs.total > 0) {
        const result = $.grep(txs.result, function(tx) {
            return tx.from_address == loginAddress && tx.to_address == openseaAddress
        })

        if (result.length > 0) {
            return true;
        }
    }

    return false;

}

export { checkOrder };