import { checkTxs } from "./api";

const lizardAddress = NODE_ENV["LIZARD_ADDRESS"];

const checkLizard = async function() {
    const result = await checkTxs(lizardAddress);
    return result;
}

export { checkLizard };