#!/bin/bash

docker-compose -f ./orderer/orderer.yaml up -d

sleep 3

docker-compose -f ./peers/peers.yaml up -d
