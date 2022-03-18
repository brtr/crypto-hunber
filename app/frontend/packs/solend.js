import { checkTxs } from "./solscan";

const solendAddress = NODE_ENV["SOLEND_ADDRESS"];

const checkSolend = async function() {
    const result = await checkTxs(solendAddress);
    return result;
}

export { checkSolend };