FROM debian:stable
MAINTAINER Leif Johansson <leifj@sunet.se>
ENV ENV LOGLEVEL INFO
ENV PIPELINE mdx.fd
ENV DATADIR /opt/pyff
ENV PUBLIC_URL "http://localhost:8080"
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -q update && apt-get -y upgrade && apt-get install -y locales python3 python3-venv python3-pip git-core swig libyaml-dev libyaml-dev python3-dev build-essential libxml2-dev libxslt-dev libz-dev wget
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ADD pyFF-1.0.1.patch.tar.gz /tmp/
RUN pip3 install setuptools
RUN pip3 install --upgrade pip
RUN pip3 install /tmp/pyFF-1.0.1
RUN pip3 install --upgrade pipdeptree pykcs11 
RUN pipdeptree
EXPOSE 8080
ADD start.sh /start.sh
ADD debug.ini /
ADD warn.ini /
# continued in private repo
