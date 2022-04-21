import { checkToken } from "./api";

const degensAddress = NODE_ENV["DEGENS_ADDRESS"];

const checkDegens = async function() {
    const result = await checkToken(degensAddress);
    return result;
}

export { checkDegens };