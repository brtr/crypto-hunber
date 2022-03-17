import { checkToken } from "./solscan";

const saberAddress = NODE_ENV["SABER_ADDRESS"];

const checkSaber = async function() {
    const result = await checkToken(saberAddress);
    return result;
}

export { checkSaber };