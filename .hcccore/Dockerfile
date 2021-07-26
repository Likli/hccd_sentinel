FROM hcccrypto/hccd
LABEL maintainer="HCC Developers"
LABEL description="Dockerised hccd"
COPY start.sh /root/.hcccore/start.sh

ENV HOME /sentinel
WORKDIR /sentinel

ADD .hcccore/start.sh /

CMD /start.sh
