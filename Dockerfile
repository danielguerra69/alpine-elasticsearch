FROM danielguerra/alpine-sdk-build:edge as builder
RUN docker-entrypoint.sh
ADD APKBUILD /tmp/aports/community/elasticsearch
RUN build community elasticsearch

FROM alpine:edge
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>
COPY --from=builder /home/sdk/.abuild /.abuild
RUN find /.abuild -name "*.pub" -exec cp {} /etc/apk/keys \;
COPY --from=builder /home/sdk/packages /packages
WORKDIR /packages/community/x86_64/
RUN apk --update --no-cache add elasticsearch-6.2.4-r0.apk elasticsearch-lang-painless-6.2.4-r0.apk \
    && rm -rf /tmp/* /var/cache/apk/* /packages
WORKDIR /usr/share
ADD config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN mkdir -p /usr/share/java/elasticsearch/plugins /usr/share/java/elasticsearch/config /usr/share/java/elasticsearch/data
RUN cp /etc/elasticsearch/* /usr/share/java/elasticsearch/config
RUN chown -R elastico:elastico /usr/share/java/elasticsearch
ADD docker-entrypoint.sh /usr/sbin
ADD elasticsearch-env /usr/share/java/elasticsearch/bin
VOLUME ["/usr/share/java/elasticsearch/plugins","/usr/share/java/elasticsearch/config","/usr/share/java/elasticsearch/data","/dump"]
EXPOSE 9200 9300
ENTRYPOINT ["docker-entrypoint.sh"]
USER elastico
CMD ["/usr/share/java/elasticsearch/bin/elasticsearch"]