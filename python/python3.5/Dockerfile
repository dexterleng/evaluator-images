FROM coursemology/evaluator-image-c_cpp:latest
MAINTAINER Coursemology <coursemology@googlegroups.com>

RUN apt-get update && apt-get install --force-yes -y wget \
  zlib1g-dev libssl-dev git \
  && cd /root \
  && wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz \
  && tar xzf Python-3.5.2.tgz \
  && cd /root/Python-3.5.2 \
  && ./configure \
  && make \
  && make install \
  && pip3 install git+https://github.com/Coursemology/unittest-xml-reporting.git@extra-attributes \
  && pip3 install timeout-decorator \
  && cd /root \
  && rm -r /root/Python-3.5.2 \
  && rm -r /root/Python-3.5.2.tgz \
  && apt-get remove -y git \
  && rm -rf /var/lib/apt/lists/*
ENV PYTHON=/usr/local/bin/python3.5
