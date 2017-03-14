FROM coursemology/evaluator-image-base:latest
MAINTAINER Coursemology <coursemology@googlegroups.com>

# Set HOME variable to a location accessible by the coursemology user
# Needed to clone GoogleTest framework to a location accessible by the coursemology user.
ENV HOME /home/coursemology

RUN apt-get update && apt-get install -y --force-yes \
	build-essential git \
  && git clone https://github.com/google/googletest.git $HOME/googletest \
  && apt-get remove -y git \
  && apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*

# Set env var for GoogleTest to output an xml report file
ENV GTEST_OUTPUT xml:./report.xml
