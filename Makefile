.PHONY: gen lint breaking clean

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
	@rm -rf gen dist pysrc

gen: lint breaking clean
	@echo "==> Generating code with buf"
	@buf generate
	@echo "\tCode generated successfully"
	@echo "==> Building python package"
	@mkdir -p pysrc && cp -r gen/python/* pysrc/
	@touch pysrc/py.typed
	@find ./pysrc/ -type d -exec touch {}/__init__.py \;
	@python -m build
	#@rm -rf pysrc
	@echo "\tPython package built successfully"