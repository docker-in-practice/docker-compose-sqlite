FROM ubuntu:14.04
RUN apt-get update && apt-get -y install rlwrap sqlite socat
EXPOSE 12345
