import { checkTxs } from "./api";

const exchangeAddress = NODE_ENV["EXCHANGE_ADDRESS"];

const checkExchange = async function() {
    const result = await checkTxs(exchangeAddress);
    return result;
}

export { checkExchange };