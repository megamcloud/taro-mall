#!/usr/bin/env bash
if test "$1" == "y"
then
cd rxjava-service/service-goods
fi

mvn clean install -Prelease

if test "$1" == "y"
then
cd ../..
fi

service_goods_tag=registry.cn-shanghai.aliyuncs.com/taro-mall/service-goods:latest

if test "$1" == "y";
then
    docker build ./rxjava-service/service-goods/target/docker-bin/ -t ${service_goods_tag}
else
    docker build ./target/docker-bin/ -t ${service_goods_tag}
fi

docker push ${service_goods_tag}