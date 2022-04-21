import { checkTxs } from "./api";

const siriusAddress = NODE_ENV["SIRIUS_ADDRESS"];

const checkSirius = async function() {
    const result = await checkTxs(siriusAddress);
    return result;
}

export { checkSirius };