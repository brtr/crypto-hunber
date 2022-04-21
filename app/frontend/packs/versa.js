import { checkTxs } from "./api";

const versaAddress = NODE_ENV["VERSA_ADDRESS"];

const checkVersa = async function() {
    const result = await checkTxs(versaAddress);
    return result;
}

export { checkVersa };