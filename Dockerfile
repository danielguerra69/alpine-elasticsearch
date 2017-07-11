FROM elasticsearch:5.2.2-alpine
ENV CLUSTER_NAME=elasticsearch-default \
    NODE_MASTER=true \
    NODE_DATA=true \
    UNICAST_HOSTS=""
ADD config /usr/share/elasticsearch/config
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
