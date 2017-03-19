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

# Compile GTest library so that it doesn't need to be compiled on each evaluation
# The GTEST library would then be available as ${GTEST_DIR}/libgtest.a
ENV GTEST_DIR $HOME/googletest/googletest

RUN cd $GTEST_DIR/ \
  && g++ -isystem ${GTEST_DIR}/include -I${GTEST_DIR} \
     -pthread -c ${GTEST_DIR}/src/gtest-all.cc \
  && ar -rv libgtest.a gtest-all.o

# Set env var for GoogleTest to output an xml report file
ENV GTEST_OUTPUT xml:./report.xml
