FROM ubuntu:18.04
COPY ttyd /usr/bin/ttyd

RUN apt-get update && apt-get install -y libwebsockets-dev libjson-c-dev cowsay

RUN useradd -ms /bin/bash adventurer
COPY usr/games /usr/games
COPY huanglipang /home/adventurer
RUN chown -R root /home/adventurer && chmod 755 /tmp
USER adventurer
WORKDIR /home/adventurer

EXPOSE 8001

CMD ["ttyd", "-t", "titleFixed=huanglipang-termifolio", "-t", "fontSize=15", "-p", "8001", "bash"]