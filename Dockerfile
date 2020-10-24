FROM ubuntu:18.04
COPY ttyd /usr/bin/ttyd

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /sbin/tini
RUN chmod +x /sbin/tini

RUN apt-get update && apt-get install -y libwebsockets-dev libjson-c-dev fortune cowsay

RUN useradd -ms /bin/bash adventurer
ADD bin /bin
ADD huanglipang /home/adventurer
RUN chown -R root /home/adventurer && chmod 755 /tmp
USER adventurer
WORKDIR /home/adventurer

EXPOSE 8001

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["ttyd", "-t", "titleFixed=huanglipang-termifolio", "-t", "fontSize=15", "-p", "8001", "bash"]