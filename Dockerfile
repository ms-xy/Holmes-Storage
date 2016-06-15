FROM golang:1.6.2

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y curl libmagic-dev gcc apt-transport-https

ENV GOROOT /usr/local/go
RUN go get -v -x -u "github.com/HolmesProcessing/Holmes-Storage"

RUN mkdir -p /data/holmes-storage/
WORKDIR /data/holmes-storage/

CMD ["/go/bin/Holmes-Storage", "--config=config.json"]
