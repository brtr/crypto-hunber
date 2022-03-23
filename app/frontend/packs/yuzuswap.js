import { checkTxs } from "./api";

const yuzuSwapAddress = NODE_ENV["YUZU_SWAP_ADDRESS"];

const checkYuzuSwap = async function() {
    const result = await checkTxs(yuzuSwapAddress);
    return result;
}

export { checkYuzuSwap };