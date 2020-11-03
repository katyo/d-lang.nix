FROM ubuntu:trusty
RUN \
  apt-get update -y && \
  apt-get -f install -y \
  build-essential autoconf autogen bison dejagnu flex flip \
  gawk git gperf gzip nsis openssh-client p7zip-full perl \
  python-dev libisl-dev scons tcl texinfo tofrodos wget zip \
  texlive texlive-extra-utils libncurses5-dev
RUN \
  useradd -ms /bin/bash builder && \
  mkdir /home/builder/workspace
USER builder
WORKDIR /home/builder/workspace
