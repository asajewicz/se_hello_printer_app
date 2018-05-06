.PHONY: test test_ui test_api

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test  -v -m "not uitest"

test_smoke:
	curl -I --fail 127.0.0.1:5000

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --junit-xml=test_results.xml

test_api:
	python test_api/check_api.py

test_ui:
	py.test -s --verbose test_ui/test_ui.py

run:
	python main.py

docker_build:
	docker build -t hello_world_printer .

docker_run: docker_build
	docker run \
		--name hello_world_printer_dev \
			-p 5000:5000 \
			-d hello_world_printer

USERNAME=asajewicz
TAG=$(USERNAME)/hello_world_printer

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag hello_world_printer $(TAG); \
	docker push $(TAG); \
	docker logout;
