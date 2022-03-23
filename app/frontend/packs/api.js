const loginAddress = localStorage.getItem("loginAddress");

const checkTxs = async function(tokenAddress) {
    const url = `https://explorer.emerald.oasis.dev/api?module=account&action=txlist&address=${loginAddress}`;
    const txs = await $.get(url);
    console.log("txs: ", txs);

    if (txs.result.length > 0) {
        const result = $.grep(txs.result, function(tx) {
            return tx.tokenAddress == tokenAddress;
        })

        if (result.length > 0) {
            return true;
        }
    }

    return false;

}

const checkTokenTransfer = async function(tokenAddress) {
    const url = `https://explorer.emerald.oasis.dev/api?module=account&action=tokentx&address=${loginAddress}&contractaddress=${tokenAddress}`;
    const txs = await $.get(url);
    console.log("txs: ", txs);

    if (txs.result.length > 0) {
        return true;
    }

    return false;
}

export { checkTxs, checkTokenTransfer };