#!/usr/bin/env bash

NAME=$1
REPO=asuna.azurecr.io
BASE=$REPO/$NAME

AZ_SP_CREDENTIALS_FILE=$2

# Build
GIT_COMMIT=`git log | head -n 1 | cut -d " " -f 2`
docker build \
       -f $NAME \
       -t $BASE:$GIT_COMMIT \
       -t $BASE:latest \
       --build-arg az_sp_credentials=$AZ_SP_CREDENTIALS_FILE \
       .

# Push
docker push $BASE:$GIT_COMMIT
docker push $BASE:latest
