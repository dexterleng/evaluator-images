FROM coursemology/evaluator-image-base:latest
MAINTAINER Coursemology <coursemology@googlegroups.com>

RUN apt-get update && apt-get install -y --force-yes \
	python2.7 \
	python2.7-dev \
	python-pip \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip install unittest-xml-reporting
ENV PYTHON=/usr/bin/python2.7
