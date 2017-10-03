FROM golang:1.8.0 

#$GOPATHに/go/srcを追加
ENV GOPATH $GOPATH:/go/src 

RUN apt-get update && \
    apt-get upgrade -y

#revel，revel-cli，gorm，go-sql-driver, valval, mymysql, gooseのインストール
RUN go get github.com/revel/revel \
    github.com/revel/cmd/revel \
    github.com/jinzhu/gorm \
    github.com/go-sql-driver/mysql \
    github.com/wcl48/valval \
    github.com/ziutek/mymysql/... \
    bitbucket.org/liamstask/goose/cmd/goose

#アプリケーション(revel-docker)をマウントするためのディレクトリを作成
RUN mkdir /go/src/revel-docker

#revelはポート9000で実行されるのでポート9000の開放
EXPOSE 9000