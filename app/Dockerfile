FROM alpine:latest

ENV APP_ROOT=/opt/app
ENV TZ="Asia/Tokyo"
WORKDIR ${APP_ROOT}

# パッケージの準備
RUN apk add --update \
    python3 \
    uwsgi \
    uwsgi-http \
    uwsgi-python3 \
    uwsgi-logfile \
        && rm -rf /var/cache/apk/*

# ユーザの準備
RUN apk add --virtual .useradd-deps \
        shadow \
    && groupadd app -g 1000 \
    && useradd -c app -d ${APP_ROOT} -s /bin/sh -u 1000 -g app -G uwsgi -r app \
    && apk del .useradd-deps

# 依存Pythonライブラリ一覧コピー
ADD requirements.txt ./

# 依存Pythonライブラリインストール
RUN pip3 install --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt
ADD --chown=app:app entrypoint.sh ./
ADD --chown=app:app src ./src

# ユーザの切替
USER app
EXPOSE 8080
ENTRYPOINT ["./entrypoint.sh"]

