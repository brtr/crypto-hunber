import { checkToken } from "./solscan";

const raydiumAddress = NODE_ENV["RAYDIUM_ADDRESS"];

const checkRaydium = async function() {
    const result = await checkToken(raydiumAddress);
    return result;
}

export { checkRaydium };