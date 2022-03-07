import { checkOrder } from "./moralis";

const pangolinAddress = NODE_ENV["PANGOLIN_ADDRESS"];

const checkPangolin = async function() {
    const result = await checkOrder([pangolinAddress], "avalanche");
    return result;
}

export { checkPangolin };