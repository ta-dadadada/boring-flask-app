FROM python:3.13.9-alpine3.22

ENV APP_ROOT=/opt/app
ENV TZ="Asia/Tokyo"
WORKDIR ${APP_ROOT}

# ビルド依存パッケージとランタイム依存パッケージの準備
RUN apk add --update --no-cache \
    gcc \
    musl-dev \
    linux-headers \
    pcre-dev \
    mailcap \
        && rm -rf /var/cache/apk/*

# ユーザの準備
RUN apk add --virtual .useradd-deps \
        shadow \
    && groupadd app -g 1000 \
    && useradd -c app -d ${APP_ROOT} -s /bin/sh -u 1000 -g app -r app \
    && apk del .useradd-deps

# 依存Pythonライブラリ一覧コピー
ADD requirements.txt ./

# 依存PythonライブラリとuWSGIをインストール
RUN pip3 install --upgrade pip==25.2 \
    && pip3 install --no-cache-dir -r requirements.txt \
    && pip3 install --no-cache-dir uwsgi==2.0.28
ADD --chown=app:app entrypoint.sh ./
ADD --chown=app:app src ./src

# ユーザの切替
USER app
EXPOSE 9000
ENTRYPOINT ["./entrypoint.sh"]

