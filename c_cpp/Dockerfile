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

# Compile GTest libraries so they do not need to be compiled on each evaluation
# After compilation, copy to GTEST_DIR
ENV GTEST_DIR $HOME/googletest/googletest

RUN cd $GTEST_DIR/make \
  && make gtest_main.a \
  && make gtest.a \
  && cp gtest_main.a gtest.a $GTEST_DIR

# Set env var for GoogleTest to output an xml report file
ENV GTEST_OUTPUT xml:./report.xml
