FROM golang:1.11

ENV GOPATH /root
ENV PATH $PATH:/root/bin:/usr/local/go/bin:/usr/local/bin
ENV GOBIN /usr/local/bin

RUN apt update && apt install -y curl unzip
RUN curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
RUN unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
RUN mv protoc3/bin/* /usr/local/bin/
RUN mv protoc3/include/* /usr/local/include/

RUN rm -rf protoc-3.2.0-linux-x86_64.zip protoc3

RUN go get -u github.com/golang/dep/cmd/dep
