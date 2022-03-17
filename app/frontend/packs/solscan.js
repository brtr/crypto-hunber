const loginAddress = localStorage.getItem("loginAddress");
const url = "https://public-api.solscan.io/account/splTransfers?offset=0&limit=50&account=" + loginAddress

const checkToken = async function(tokenAddress) {
    const txs = await $.get(url);
    console.log("txs: ", txs);

    if (txs.total > 0) {
        const result = $.grep(txs.data, function(tx) {
            return tx.tokenAddress == tokenAddress
        })

        if (result.length > 0) {
            return true;
        }
    }

    return false;
}

export { checkToken };