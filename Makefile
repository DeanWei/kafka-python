.DELETE_ON_ERROR:

all: test itest

test:
	tox -e py27
	tox -e py35

itest:
	docker build -t kafka_python_test .
	docker run kafka_python_test

clean:
	rm -rf kafka-python.egg-info/ .tox/
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete
	docker rmi -f kafka_python_test

docs:
	tox -e docs

.PHONY: docs test all
