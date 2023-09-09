FROM debian:buster

ARG GO_VERSION=go1.21.0.linux-amd64.tar.gz

RUN apt-get update && \
    apt-get install -y wget vim 

WORKDIR /tmp
RUN wget https://go.dev/dl/$GO_VERSION
RUN tar -C /usr/local -xzf /tmp/$GO_VERSION

ENV GOROOT=/usr/local/go
#ENV GOPATH=/app
ENV PATH=$PATH:$GOROOT/bin

WORKDIR /app

COPY . .
RUN go mod init program
RUN go test -v ./...
RUN go build -o program main.go
ENV PATH=$PATH:/app
CMD ["program"]

#ENTRYPOINT ["/bin/bash"]
