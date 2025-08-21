PROVIDER_URL ?= https://arb1.arbitrum.io/rpc
RETRY_COUNT ?= 0
DELAY_MS ?= 5000

rpc:
	@if ! docker image inspect provider-connection-pool >/dev/null 2>&1; then \
		echo "Building Docker image..."; \
		docker build -t provider-connection-pool . --no-cache; \
	fi
	@echo Run call eth_getBlockNumber to rpc-provider...
	docker run --rm -d \
		--name rpc-provider-connection \
		-e PROVIDER_URL=$(PROVIDER_URL) \
		-e RETRY_COUNT=$(RETRY_COUNT) \
		-e DELAY_MS=$(DELAY_MS) \
		provider-connection-pool

	docker exec -it rpc-provider-connection /app/netstat.sh

ws:
	@if ! docker image inspect provider-connection-pool >/dev/null 2>&1; then \
		echo "Building Docker image..."; \
		docker build -t provider-connection-pool . --no-cache; \
	fi
	@echo Run call eth_getBlockNumber to rpc-provider...
	docker run --rm -d \
		--name websocket-provider-connection \
		-e PROVIDER_URL=$(PROVIDER_URL) \
		-e RETRY_COUNT=$(RETRY_COUNT) \
		-e DELAY_MS=$(DELAY_MS) \
		provider-connection-pool

	docker exec -it websocket-provider-connection /app/netstat.sh
