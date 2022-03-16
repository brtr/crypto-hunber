const server = NODE_ENV["MORALIS_SERVER"];
const appId = NODE_ENV["MORALIS_APPID"];
Moralis.start({ serverUrl: server, appId: appId });

const loginAddress = localStorage.getItem("loginAddress");

const checkTokens = async function(addresses) {
    const options = { address: loginAddress };
    const txs = await Moralis.Moralis.SolanaAPI.account.getSPL(options);
    if (txs.length > 0) {
        const result = $.grep(txs, function(tx) {
            return $.inArray(tx.mint, addresses) >= 0;
        })

        if (result.length > 0) {
            return true;
        }
    }

    return false;

}

export { checkTokens };