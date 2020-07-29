#! /usr/bin/make
CURRENT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
Version:=v1.0.4
AppName:=themis-ui

all: build docker push

docker:
	@docker build -t  registry.cn-hangzhou.aliyuncs.com/vdo/${AppName}:${Version} .
push:
	@docker push registry.cn-hangzhou.aliyuncs.com/vdo/${AppName}:${Version}
build:
	@npm install mirror-config-china --registry=http://registry.npm.taobao.org && npm install node-sass && npm install && npm run build-pro
docker-run:
	@docker rm -f ${AppName}
	@docker run --name ${AppName} --restart=always -d -p 8085:80 -e BASE_API="http://118.31.56.227:38085" registry.cn-hangzhou.aliyuncs.com/cft-guma/${AppName}:${Version}
docker-push: docker push
