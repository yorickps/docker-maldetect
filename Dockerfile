FROM alpine:3
LABEL maintainer="Yorick Poels"

RUN apk add --no-cache wget tar bash perl  &&\
    rm -rf /var/cache/apk/*

WORKDIR /tmp

RUN wget https://www.rfxn.com/downloads/maldetect-current.tar.gz --no-check-certificate &&\
    tar -xvf maldetect-current.tar.gz

RUN bash -x ./maldetect-*/install.sh

COPY ./files/internals/internals.conf /usr/local/maldetect/internals/internals.conf    

#RUN /usr/local/maldetect/maldet -u

ENTRYPOINT ["/usr/local/maldetect/maldet"]
