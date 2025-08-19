import { ethers } from "ethers";
import { retry } from "./utils/retry";
import dotenv from "dotenv"
dotenv.config()

async function main() {
  const url = process.env.PROVIDER_URL;
  if (!url) throw new Error("process.env.PROVIDER_URL Required");

  let provider: ethers.WebSocketProvider | ethers.JsonRpcProvider;

  if (url.startsWith("ws://") || url.startsWith("wss://")) {
    provider = new ethers.WebSocketProvider(url);
  } else if (url.startsWith("http://") || url.startsWith("https://")) {
    provider = new ethers.JsonRpcProvider(url);
  } else {
    throw new Error("Invaild provider url format");
  }

  const retryCount = process.env.RETRY_COUNT ? Number(process.env.RETRY_COUNT) : undefined
  const delay = process.env.DELAY_MS ?  Number(process.env.DELAY_MS) : undefined
  
  await retry(delay,retryCount,() => provider.getBlockNumber())
}

void main().catch(err => console.log(err))