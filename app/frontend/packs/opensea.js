import { checkOrder } from "./moralis";

const openseaV1Address = NODE_ENV["OPENSEA_V1_ADDRESS"];
const openseaV2Address = NODE_ENV["OPENSEA_V2_ADDRESS"];

const checkOpensea = async function() {
    const result = await checkOrder([openseaV1Address, openseaV2Address]);
    return result;
}

export { checkOpensea };