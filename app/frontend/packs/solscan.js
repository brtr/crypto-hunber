const loginAddress = localStorage.getItem("loginAddress");

const checkToken = async function(tokenAddress) {
    const url = "https://public-api.solscan.io/account/splTransfers?offset=0&limit=50&account=" + loginAddress
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

const checkTxs = async function(programAddress) {
    const url = "https://public-api.solscan.io/account/transactions?limit=50&account=" + loginAddress
    const txs = await $.get(url);
    console.log("txs: ", txs);
    let result = []

    if (txs.length > 0) {
        txs.forEach(function(tx) {
            tx.parsedInstruction.forEach(function(i) {
                if (i.programId == programAddress) {
                    result.push(tx);
                }
            })
        })

        if (result.length > 0) {
            return true;
        }
    }

    return false;
}

export { checkToken, checkTxs };