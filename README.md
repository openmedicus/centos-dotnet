# centos-dotnet

Microsoft dotnet in a CentOS 7 Container

Version: 1.0.0-preview2-003121

### Create your own docker container with your app

Dockerfile
```
FROM docker.io/openmedicus/centos-dotnet
COPY your_app /app
WORKDIR /app
 
RUN ["dotnet", "restore"]
 
EXPOSE 5000/tcp

ENTRYPOINT ["dotnet", "run"]
```

> docker build -t your_app_name .

Remeber to build on CentOS 7. Creating the docker image on a host system with kernel 4.6 will make it fail.
