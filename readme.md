```
docker build -t test-con-pool . --no-cache

docker run --rm \
  -e PROVIDER_URL=https://arb1.arbitrum.io/rpc \
  -e RETRY_COUNT=0 \
  -e DELAY_MS=5000 \
  -e LOG_LEVEL=debug \
   test-con-pool

docker run --rm \
  -e PROVIDER_URL=wss://mainnet.gateway.tenderly.co \
  -e RETRY_COUNT=0 \
  -e DELAY_MS=5000 \
  -e LOG_LEVEL=debug \
   test-con-pool
```