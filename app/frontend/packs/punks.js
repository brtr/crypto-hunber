import { checkToken } from "./api";

const punksAddress = NODE_ENV["PUNK_ADDRESS"];

const checkPunks = async function() {
    const result = await checkToken(punksAddress);
    return result;
}

export { checkPunks };