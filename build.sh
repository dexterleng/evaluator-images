#!/bin/bash

BASE_FOLDER=base
CURRENT_PATH=$(pwd)

# Function to build images (without version tags) for folders where the Dockerfile is at the top level.
# This is the case for the base and languages for which only a single version is supported.
# Any image that differs from it should have its on build script.
build_generic() {
  FOLDER=$1
  cd $FOLDER

  REGISTRY=coursemology
  IMAGE_NAME=$REGISTRY/evaluator-image-$FOLDER

  echo "IN $(pwd)"
  echo "Building $IMAGE_NAME"

  docker build -t $IMAGE_NAME .

  cd $CURRENT_PATH
}

build() {
  # Look for build.sh in the folder, if it doesn't exist use the generic build method.
  FOLDER=$1
  NEXT_PATH=$CURRENT_PATH/$FOLDER
  if [ -f $NEXT_PATH/build.sh ]; then
    cd $NEXT_PATH
    bash build.sh
    cd $CURRENT_PATH
  else
    build_generic $FOLDER
  fi
}

# Build the base docker image first.
build $BASE_FOLDER

for f in $(pwd)/*;
  do
    if [ ! -d $f ]; then
      continue
    fi

    FOLDER_NAME=`basename $f`

    # This is the folder with the Dockerfile for the base image. Skip it since it has already been built
    if [ $FOLDER_NAME == $BASE_FOLDER ]; then
      continue
    fi

    build $FOLDER_NAME
  done;
