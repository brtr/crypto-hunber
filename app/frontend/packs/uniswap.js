import { checkOrder } from "./moralis";

const uniswapAddress = NODE_ENV["UNISWAP_ADDRESS"];

const checkUniSwap = async function() {
    const result = await checkOrder([uniswapAddress]);
    return result;
}

export { checkUniSwap };