all: build tag push

download:
	curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=809131

pull:
	sudo docker pull centos:7

build:
	sudo docker build -t centos-dotnet .

tag:
	sudo docker tag centos-dotnet openmedicus/centos-dotnet:latest

push:
	sudo docker push openmedicus/centos-dotnet

