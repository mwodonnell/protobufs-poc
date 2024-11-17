.PHONY: gen lint breaking clean

gen: lint breaking clean
	@echo "==> Generating code with buf"
	@buf generate
	@echo "\tCode generated successfully"

lint:
	@echo "==> Linting code with buf"
	@ buf lint
	@echo "\tNo linting errors found"

breaking:
	@echo "==> Checking for breaking changes against main with buf"
	@buf breaking --against '.git#branch=main'
	@echo "\tNo breaking changes found"

clean:
	@echo "==> Cleaning up generated code"
	@rm -rf gen