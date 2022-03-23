import { checkTokenTransfer } from "./api";

const fountainAddress = NODE_ENV["FOUNTAIN_ADDRESS"];

const checkFountain = async function() {
    const result = await checkTokenTransfer(fountainAddress);
    return result;
}

export { checkFountain };