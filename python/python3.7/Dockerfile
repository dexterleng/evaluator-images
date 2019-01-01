FROM coursemology/evaluator-image-base:latest
MAINTAINER Coursemology <coursemology@googlegroups.com>

RUN apt-get update && apt-get install --force-yes -y wget \
  build-essential libssl-dev zlib1g-dev libbz2-dev libffi-dev git libsqlite3-dev \
  && wget -qO- https://www.openssl.org/source/openssl-1.0.2g.tar.gz | tar xz && cd openssl-1.0.2g && ./config shared --prefix=/usr/local/ && make && make install \
  && export LDFLAGS="-L/usr/local/lib/" \
  && export LD_LIBRARY_PATH="/usr/local/lib/" \
  && export CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl" \
  && cd /root \
  && wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz \
  && tar xzf Python-3.7.2.tgz \
  && cd /root/Python-3.7.2 \
  && ./configure \
  && make \
  && make install \
  && pip3 install git+https://github.com/Coursemology/unittest-xml-reporting.git@extra-attributes \
  && pip3 install timeout-decorator \
  && pip3 install Pillow \
  && pip3 install numpy \
  && pip3 install scipy \
  && pip3 install matplotlib \
  && pip3 install pandas \
  && cd /root \
  && rm -r /root/Python-3.7.2 \
  && rm -r /root/Python-3.7.2.tgz \
  && apt-get remove -y git \
  && rm -rf /var/lib/apt/lists/*
ENV PYTHON=/usr/local/bin/python3.7
