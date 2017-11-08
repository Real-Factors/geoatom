#! /bin/bash

#Make sure SSH default, insecure key is enabled
curl -o insecure_key -fSL https://github.com/phusion/baseimage-docker/raw/master/image/services/sshd/keys/insecure_key
chmod 600 insecure_key

docker pull postgres
docker build postgres
docker build -t realfactors/unique-id .
