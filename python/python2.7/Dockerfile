FROM coursemology/evaluator-image-c_cpp:latest
MAINTAINER Coursemology <coursemology@googlegroups.com>

RUN apt-get update && apt-get install -y --force-yes \
	python2.7 \
	python2.7-dev \
	python-pip \
  git \
	&& pip install git+https://github.com/Coursemology/unittest-xml-reporting.git@extra-attributes \
  && apt-get remove -y git \
	&& rm -rf /var/lib/apt/lists/*
ENV PYTHON=/usr/bin/python2.7
