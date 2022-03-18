import { checkToken } from "./solscan";

const grapeAddress = NODE_ENV["GRAPE_ADDRESS"];

const checkGrape = async function() {
    const result = await checkToken(grapeAddress);
    return result;
}

export { checkGrape };