import { checkOrder } from "./moralis";

const lidoAddress = NODE_ENV["LIDO_ADDRESS"];

const checkLido = async function() {
    const result = await checkOrder([lidoAddress], "eth");
    return result;
}

export { checkLido };