.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / \
		{printf "\033[38;2;98;209;150m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

export
NOW = $(shell date '+%Y%m%d-%H%M%S')
TOKEN = "no-key"

.PHONY: models
models: ## models
	curl --request GET --insecure \
		--header "Content-Type: application/json" \
		--header "Authorization: Bearer $(TOKEN)" \
		--url https://vllm-lws.ezua.tf-ai.io/v1/models \
		| jq .
