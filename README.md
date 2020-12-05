# Termifolio
This is my [terminal portfolio](https://huanglipang.me) repository.

## Descrition
The portforlio is based on web terminal developed by [ttyd](https://github.com/tsl0922/ttyd). I modified the [dockerfile](https://hub.docker.com/r/tsl0922/ttyd/dockerfile) and compiled the tty by myself.

## Deployment on AWS EC2
Clone the source code:
  
    git clone https://github.com/HuangLiPang/termifolio.git && cd termifolio  

Build from [makefile](./makefile):

    sudo make build && sudo make up
    
Set the security group for your EC2 instance. The docker instance exposes port 8001 to port 443 and 80, so you need to set inbound rule open for these 2 ports for your EC2 instance.
![](https://i.imgur.com/kvhFLFv.png)


## Reference
1. [ttyd](https://github.com/tsl0922/ttyd):
    - ttyd [client options](https://github.com/tsl0922/ttyd/wiki/Client-Options)
    - [ttyd docker image](https://hub.docker.com/r/tsl0922/ttyd)
2. [Dockerfile](https://docs.docker.com/engine/reference/builder/)
3. [docker-compose](https://docs.docker.com/compose/compose-file/)
4. [cowsay](https://en.wikipedia.org/wiki/Cowsay):
    - [cowfile](https://github.com/paulkaefer/cowsay-files)
5. [text table](https://www.tablesgenerator.com/text_tables)
