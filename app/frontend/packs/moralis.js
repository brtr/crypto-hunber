const server = NODE_ENV["MORALIS_SERVER"];
const appId = NODE_ENV["MORALIS_APPID"];
Moralis.start({ serverUrl: server, appId: appId });

const loginAddress = localStorage.getItem("loginAddress");

const checkOrder = async function(addresses) {
    const options = { address: loginAddress, limit: 1000 };
    const txs = await Moralis.Web3API.account.getTransactions(options);

    if (txs.total > 0) {
        const result = $.grep(txs.result, function(tx) {
            return tx.from_address == loginAddress && $.inArray(tx.to_address, addresses);
        })

        if (result.length > 0) {
            return true;
        }
    }

    return false;

}

export { checkOrder };