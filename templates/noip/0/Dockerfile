FROM ubuntu:16.04

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install wget && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY no-ip-docker.sh /root/no-ip-docker.sh
RUN chmod +x /root/no-ip-docker.sh

ENTRYPOINT ["/root/no-ip-docker.sh"]