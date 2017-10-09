![Elasticsearch](https://www.runabove.com/images/apps/elasticsearch-and-kibana.png)

# About
Elasticsearch on alpine linux
> [wikipedia.org/wiki/Elasticsearch](https://en.wikipedia.org/wiki/Elasticsearch)

For kibana on alpine check.
[danielguerra/alpine-kibana](https://hub.docker.com/r/danielguerra/alpine-kibana/)

## Tags
latest  elasticsearch 2.4.4
5.2.2   elasticsearch 5.2.2
5.0.0   elasticsearch 5.0.0
2.4.1   elasticsearch 2.4.1
2.4.0   elasticsearch 2.4.0
2.2.2   elasticsearch 2.2.2
2.0.0   elasticsearch 2.0.0

1.6     elasticsearch 1.6

## Usage

```bash
docker run -p 9200:9200 -d danielguerrra/alpine-elasticsearch:5.2.2
docker run -d -v "$PWD/esdata":/usr/share/java/elasticsearch/data \
danielguerrra/alpine-elasticsearch:2.4.4 -Des.node.name="TestNode"
```

or advanced

```bash
docker run -d  --env MAX_OPEN_FILES=65535 --env MAX_LOCKED_MEMORY=unlimited --env ES_JAVA_OPTS=-server \ --hostname=elasticsearch-master  --name elasticsearch-master  danielguerrra/alpine-elasticsearch \ -Des.network.bind_host=elasticsearch-master --cluster.name=mycluster --node.name=elasticsearch-master \ --discovery.zen.ping.multicast.enabled=false --network.host=elasticsearch-master
```
