#!/bin/bash


rm -rf ./update/*  &&\
rm -rf ./update/.git*  &&\
git clone https://github.com/exeex/amd_miner.git ./update &&\
cp -r ./update/* ~/



