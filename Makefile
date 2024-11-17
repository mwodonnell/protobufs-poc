.PHONY: gen lint breaking

gen:
	buf generate

lint:
	buf lint --error-format=json | jq .

breaking:
	buf breaking --against '.git#branch=main' --error-format=json | jq .