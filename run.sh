#!/usr/bin/env bash
# -*- coding:utf-8 -*-

source ./env.sh
otp=$(python ./otp.py $secret)

./login.sh $password $otp $host $port

