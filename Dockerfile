FROM ubuntu:18.04
COPY ttyd /usr/bin/ttyd

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /sbin/tini
RUN chmod +x /sbin/tini

RUN apt-get update && apt-get install -y libwebsockets-dev libjson-c-dev fortune cowsay

ADD huanglipang /home/huanglipang

RUN useradd -ms /bin/bash adventurer
USER adventurer
WORKDIR /home/huanglipang

COPY .bashrc /home/adventurer/.bashrc

EXPOSE 8001

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["ttyd", "-p", "8001", "bash"]