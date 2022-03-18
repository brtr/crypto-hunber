import { checkTxs } from "./solscan";

const raydiumAddress = NODE_ENV["RAYDIUM_ADDRESS"];

const checkRaydium = async function() {
    const result = await checkTxs(raydiumAddress);
    return result;
}

export { checkRaydium };