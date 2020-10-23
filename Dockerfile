FROM tsl0922/musl-cross
RUN git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd \
    && cd /ttyd && env BUILD_TARGET=x86_64 WITH_SSL=true ./scripts/cross-build.sh

FROM ubuntu:18.04
COPY --from=0 /ttyd/build/ttyd /usr/bin/ttyd

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /sbin/tini
RUN chmod +x /sbin/tini

RUN apt-get update && apt-get install -y fortune cowsay

ADD huanglipang /home/huanglipang

RUN useradd -ms /bin/bash adventurer
USER adventurer
WORKDIR /home/huanglipang

COPY .bashrc /home/adventurer/.bashrc

EXPOSE 8001

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["ttyd", "-p", "8001", "bash"]