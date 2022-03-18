import { checkTxs } from "./solscan";

const saberAddress = NODE_ENV["SABER_ADDRESS"];

const checkSaber = async function() {
    const result = await checkTxs(saberAddress);
    return result;
}

export { checkSaber };