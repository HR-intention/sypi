
default: out/lambda_sypi.zip

out/lambda_sypi.zip: Dockerfile lambda_function.py
	mkdir -p out && \
	docker build --target export-stage --output type=local,dest=out .

.PHONY: default
