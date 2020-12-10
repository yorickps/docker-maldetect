FROM alpine:3
LABEL maintainer="Yorick Poels"

RUN apk add --no-cache wget tar bash perl  &&\
    rm -rf /var/cache/apk/*

WORKDIR /tmp

RUN wget https://www.rfxn.com/downloads/maldetect-current.tar.gz --no-check-certificate &&\
    tar -xvf "$VERSION".tar.gz 

WORKDIR /tmp/linux-malware-detect 
RUN bash -x install.sh

COPY ./files/internals/internals.conf /usr/local/maldetect/internals/internals.conf    

RUN /usr/local/maldetect/maldet -u

ENTRYPOINT ["/usr/local/maldetect/maldet"]
