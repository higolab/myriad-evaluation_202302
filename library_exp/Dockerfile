FROM ubuntu:latest
RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends wget build-essential \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    \
    && mkdir -p /tmp \
    && cd /tmp \
    && wget http://nginx.org/download/nginx-1.22.1.tar.gz \
    && tar xvf nginx-1.22.1.tar.gz \
    && cd nginx-1.22.1 \
    && ./configure --without-pcre --without-http_rewrite_module --without-http_gzip_module \
    && make \
    && make install \
    && rm -rf /tmp/nginx-1.22.1 \
    \
    && mkdir -p /html
COPY index.html /html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]