import { checkOrder } from "./moralis";

const sushiswapAddress = NODE_ENV["SUSHI_SWAP_ADDRESS"];

const checkSushiSwap = async function() {
    const result = await checkOrder([sushiswapAddress], "matic");
    return result;
}

export { checkSushiSwap };