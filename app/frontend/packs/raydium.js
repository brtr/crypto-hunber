import { checkTokens } from "./moralis";

const raydiumAddress = NODE_ENV["RAYDIUM_ADDRESS"];

const checkRaydium = async function() {
    const result = await checkTokens([raydiumAddress]);
    return result;
}

export { checkRaydium };