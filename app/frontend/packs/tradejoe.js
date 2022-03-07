import { checkOrder } from "./moralis";

const tradejoeAddress = NODE_ENV["TRADEJOE_ADDRESS"];

const checkTradeJoe = async function() {
    const result = await checkOrder([tradejoeAddress], "avalanche");
    return result;
}

export { checkTradeJoe };