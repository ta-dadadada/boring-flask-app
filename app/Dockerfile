FROM alpine:latest

ENV APP_ROOT=/opt/app
WORKDIR $APP_ROOT

RUN apk add --update \
    python3 \
    uwsgi \
    uwsgi-http \
    uwsgi-python3 \
    uwsgi-logfile \
        && rm -rf /var/cache/apk/*
# 依存Pythonライブラリ一覧コピー
ADD requirements.txt ./

# 依存Pythonライブラリインストール
RUN pip3 install --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt
ADD entrypoint.sh ./
ADD src ./src

ENV TZ="Asia/Tokyo"
EXPOSE 8080
ENTRYPOINT ["./entrypoint.sh"]

