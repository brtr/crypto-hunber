import { checkTxs } from "./api";

const valleySwapAddress = NODE_ENV["VALLEY_SWAP_ADDRESS"];

const checkValleySwap = async function() {
    const result = await checkTxs(valleySwapAddress);
    return result;
}

export { checkValleySwap };