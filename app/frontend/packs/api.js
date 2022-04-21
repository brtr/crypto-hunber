const loginAddress = localStorage.getItem("loginAddress");

const checkTxs = async function(tokenAddress) {
    const url = `https://blockscout.com/astar/api?module=account&action=txlist&address=${loginAddress}`;
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

const checkToken = async function(tokenAddress) {
    const url = `https://blockscout.com/astar/api?module=account&action=tokenbalance&address=${loginAddress}&contractaddress=${tokenAddress}`;
    const res = await $.get(url);
    console.log("res: ", res);

    if (parseInt(res.result) > 0) {
        return true;
    }

    return false;
}

export { checkTxs, checkToken };