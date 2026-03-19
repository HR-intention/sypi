
default: out/lambda_pypicloud.zip

out/lambda_pypicloud.zip: Dockerfile lambda_function.py
	mkdir -p out && \
	docker build --target export-stage --output type=local,dest=out .

.PHONY: default
