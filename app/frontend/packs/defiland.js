import { checkToken } from "./solscan";

const defilandAddress = NODE_ENV["DEFILAND_ADDRESS"];

const checkDefiland = async function() {
    const result = await checkToken(defilandAddress);
    return result;
}

export { checkDefiland };