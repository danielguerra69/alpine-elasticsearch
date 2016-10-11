FROM alpine:3.4
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

ADD apk /apk
ADD .abuild/-57fca85f.rsa.pub /etc/apk/keys
RUN apk --update add /apk/elasticsearch-2.4.1-r0.apk \
  && rm -rf /apk /var/cache/apk/*
ADD docker-entrypoint.sh /usr/sbin
RUN mkdir /usr/share/java/elasticsearch/plugins /usr/share/java/elasticsearch/data /var/lib/elasticsearch
ADD bin /usr/share/java/elasticsearch/bin
ADD config /usr/share/java/elasticsearch/config
RUN chown -R elastico:elastico /usr/share/java/elasticsearch /var/lib/elasticsearch
RUN sed -i "s/:\/bin/:\/bin:\/usr\/share\/java\/elasticsearch\/bin/" /etc/profile
VOLUME ["/usr/share/java/elasticsearch/data"]
EXPOSE 9200 9300
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["elasticsearch"]
