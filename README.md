# centos-dotnet

Microsoft dotnet in a CentOS 7 Container

Version: 1.0.0-preview2-003121

[![](https://images.microbadger.com/badges/image/openmedicus/centos-dotnet.svg)](https://microbadger.com/images/openmedicus/centos-dotnet "Get your own image badge on microbadger.com")

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


### Systemd

/etc/systemd/system/docker-YOUR_APP_NAME.service

```
Unit]
Description=YOUR_APP_NAME Container
Requires=docker.service
After=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker run --name=YOUR_APP_NAME -p 8080:5000 YOUR_IMAGE_NAME -c Release 
ExecStop=/usr/bin/docker stop -t 2 YOUR_APP_NAME
ExecStopPost=/usr/bin/docker rm -f YOUR_APP_NAME

[Install]
WantedBy=default.target
```

> systemctl daemon-reload
> systemctl enable docker-YOUR_APP_NAME
> systemctl start docker-YOUR_APP_NAME

