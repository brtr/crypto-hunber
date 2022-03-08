import { checkOrder } from "./moralis";

const spookyAddress = NODE_ENV["SPOOKY_SWAP_ADDRESS"];

const checkSpookySwap = async function() {
    const result = await checkOrder([spookyAddress], "fantom");
    return result;
}

export { checkSpookySwap };