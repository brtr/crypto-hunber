import { checkTxs } from "./api";

const tofuAddress = NODE_ENV["TOFU_ADDRESS"];

const checkTofu = async function() {
    const result = await checkTxs(tofuAddress);
    return result;
}

export { checkTofu };