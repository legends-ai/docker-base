#!/usr/bin/env bash

NAME=$1
REPO=asuna.azurecr.io
BASE=$REPO/$NAME

# Build
GIT_COMMIT=`git log | head -n 1 | cut -d " " -f 2`
docker build \
       -f $NAME \
       -t $BASE:$GIT_COMMIT \
       -t $BASE:latest \
       .

# Push
docker push $BASE:$GIT_COMMIT
docker push $BASE:latest
