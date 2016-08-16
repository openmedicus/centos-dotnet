FROM centos:7
MAINTAINER Mikkel Kruse Johnsen <mikkel@xmedicus.com>

# Update
RUN yum -y update

# Clean yum
RUN yum clean all

# Install .NET Core dependencies 
RUN yum install -y \ 
	deltarpm \
	unzip \
	libunwind \
	libicu \
	gettext \
	libcurl-devel \
	openssl-devel \
	zlib \
	libicu-devel

# Install .NET Core
RUN mkdir -p /opt/dotnet
ADD dotnet.tar.gz /opt/dotnet
RUN ln -s /opt/dotnet/dotnet /usr/local/bin

