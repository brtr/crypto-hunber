import { checkTxs } from "./solscan";

const solanartAddress = NODE_ENV["SOLANART_ADDRESS"];

const checkSolanart = async function() {
    const result = await checkTxs(solanartAddress);
    return result;
}

export { checkSolanart };