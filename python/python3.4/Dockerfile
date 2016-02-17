FROM coursemology/evaluator-image-c_cpp:latest
MAINTAINER Coursemology <coursemology@googlegroups.com>

RUN apt-get update && apt-get install -y --force-yes \
	python3.4 \
	python3.4-dev \
	python3-pip \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip3 install unittest-xml-reporting
ENV PYTHON=/usr/bin/python3.4
