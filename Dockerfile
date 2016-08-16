FROM centos:7
MAINTAINER Mikkel Kruse Johnsen <mikkel@xmedicus.com>

# install Fedora repo
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-6.noarch.rpm

# Update
RUN yum -y update

# Install net tools
RUN yum install -y net-tools

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

