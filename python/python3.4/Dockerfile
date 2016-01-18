FROM coursemology/evaluator-image-base:latest
MAINTAINER Coursemology <coursemology@googlegroups.com>

RUN apt-get update && apt-get install -y --force-yes \
	python3.4 \
	python3.4-dev \
	python3-pip \
	&& pip3 install xmlrunner
