FROM alpine:edge
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>
RUN apk --update --no-cache add elasticsearch
WORKDIR /usr/share
RUN rm  -rf /tmp/* /var/cache/apk/*
ADD config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN mkdir -p /usr/share/java/elasticsearch/plugins /usr/share/java/elasticsearch/config /usr/share/java/elasticsearch/data
RUN cp /etc/elasticsearch/* /usr/share/java/elasticsearch/config
RUN chown -R elastico:elastico /usr/share/java/elasticsearch
ADD docker-entrypoint.sh /usr/sbin
VOLUME ["/usr/share/java/elasticsearch/plugins","/usr/share/java/elasticsearch/config","/usr/share/java/elasticsearch/data","/dump"]
EXPOSE 9200 9300
ENTRYPOINT ["docker-entrypoint.sh"]
USER elastico
CMD ["/usr/share/java/elasticsearch/bin/elasticsearch"]
