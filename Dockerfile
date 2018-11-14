FROM golang:1.11.0

#$GOPATHに/go/srcを追加
ENV GOPATH $GOPATH:/go/src

#アプリケーション(revel-docker)をマウントするためのディレクトリを作成
ENV APP_DIR /go/src/revel-docker/app

RUN apt-get update && \
    apt-get upgrade -y

#revel，revel-cli，gorm，go-sql-driver, valval, mymysql, gooseのインストール
RUN go get github.com/revel/revel \
    github.com/revel/cmd/revel \
    github.com/jinzhu/gorm \
    github.com/go-sql-driver/mysql \
    github.com/wcl48/valval \
    github.com/ziutek/mymysql/... \
    github.com/PuerkitoBio/goquery \
    bitbucket.org/liamstask/goose/cmd/goose

EXPOSE 9001

WORKDIR ${APP_DIR}
