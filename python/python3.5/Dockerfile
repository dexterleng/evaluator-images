FROM coursemology/evaluator-image-c_cpp:latest
MAINTAINER Coursemology <coursemology@googlegroups.com>

RUN apt-get update && apt-get install --force-yes -y wget \
  zlib1g-dev libssl-dev \
  && cd /root \
  && wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz \
  && tar xzf Python-3.5.2.tgz \
  && cd /root/Python-3.5.2 \
  && ./configure \
  && make \
  && make install \
  && pip3 install unittest-xml-reporting \
  && cd /root \
  && rm -r /root/Python-3.5.2 \
  && rm -r /root/Python-3.5.2.tgz
ENV PYTHON=/usr/local/bin/python3.5
