.PHONY: clean-pyc
PWD=$(shell pwd)
DOCKER=docker run --name blog -it -v ${PWD}:/app -w /app -e GITHUB_API_KEY=$(GITHUB_API_KEY) -p 8888:8888 -p 8000:8000 website:version0.1

.PHONY: clean-pyc
clean-pyc:
	-find . -name '*.pyc' -delete
	-find . -name '*.pyo' -delete
	-find . -name '*~' -delete
	-find . -name '.mypy_cache' | xargs rm -rf
	-find . -name '.pytest_cache' | xargs rm -rf
	-find . -name '__pycache__' | xargs rm -rf

.PHONY: build-container
build-dev-container:
	docker build -t website:version0.1 .

.PHONY: enter
enter:
	${DOCKER} bash

.PHONY: jupyter
jupyter:
	jupyter notebook --ip 0.0.0.0 --allow-root
