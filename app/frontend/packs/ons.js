import { checkTxs } from "./api";

const onsAddress = NODE_ENV["ONS_ADDRESS"];

const checkONS = async function() {
    const result = await checkTxs(onsAddress);
    return result;
}

export { checkONS };