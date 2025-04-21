FROM ubuntu:22.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://github.com/VerusCoin/VerusCoin/releases/download/v1.2.9-5/Verus-CLI-Linux-v1.2.9-5-x86_64.tgz
RUN tar zxvf Verus-CLI-Linux-v1.2.9-5-x86_64.tgz
RUN tar zxvf Verus-CLI-Linux-v1.2.9-5-x86_64.tar.gz
RUN mv verus-cli/verusd /usr/bin/verusd
RUN mv verus-cli/verus /usr/bin/verus-cli
RUN mv verus-cli/fetch-params /usr/bin/fetch-params
RUN rm -R verus-cli
RUN rm Verus*
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
RUN /usr/bin/fetch-params
CMD /usr/bin/verusd
