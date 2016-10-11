# About
Elasticsearch 2.4.1 on alpine linux
The extracted size is 130M

## Usage

```bash
docker run -p 9300:9300 -d danielguerrra/alpine-elasticsearch
docker run -d -v "$PWD/esdata":/usr/share/java/elasticsearch/data \
danielguerrra/alpine-elasticsearch -Des.node.name="TestNode"
```

or advanced

```bash
docker run -d  --env MAX_OPEN_FILES=65535 --env MAX_LOCKED_MEMORY=unlimited --env ES_JAVA_OPTS=-server \ --hostname=elasticsearch-master  --name elasticsearch-master  danielguerrra/alpine-elasticsearch \ -Des.network.bind_host=elasticsearch-master --cluster.name=mycluster --node.name=elasticsearch-master \ --discovery.zen.ping.multicast.enabled=false --network.host=elasticsearch-master
```

## Documents

> [wikipedia.org/wiki/Elasticsearch](https://en.wikipedia.org/wiki/Elasticsearch)
