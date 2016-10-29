FROM alpine:3.4
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>
ENV ELASTIC_VER=2.4.1
RUN apk --update --no-cache add openjdk8-jre
WORKDIR /usr/share
RUN wget http://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ELASTIC_VER/elasticsearch-$ELASTIC_VER.tar.gz -O - | tar xvfz - \
    && mv elasticsearch-$ELASTIC_VER elasticsearch && cd elasticsearch && rm -rf config bin
ADD bin /usr/share/elasticsearch/bin
ADD config /usr/share/elasticsearch/config
RUN mkdir /usr/share/elasticsearch/plugins /usr/share/elasticsearch/data
RUN addgroup elastico
RUN adduser  -G elastico -s /bin/false -D elastico
RUN chown -R elastico:elastico /usr/share/elasticsearch
RUN sed -i "s/:\/bin/:\/bin:\/usr\/share\/elasticsearch\/bin/" /etc/profile
ADD docker-entrypoint.sh /usr/sbin
VOLUME ["/usr/share/elasticsearch/plugins"]
VOLUME ["/usr/share/elasticsearch/config"]
VOLUME ["/usr/share/elasticsearch/data"]
EXPOSE 9200 9300
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["elasticsearch"]
