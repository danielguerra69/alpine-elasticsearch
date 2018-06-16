![Elasticsearch](https://www.runabove.com/images/apps/elasticsearch-and-kibana.png)

# About
Elasticsearch on alpine linux
> [wikipedia.org/wiki/Elasticsearch](https://en.wikipedia.org/wiki/Elasticsearch)

For kibana on alpine check.
[danielguerra/alpine-kibana](https://hub.docker.com/r/danielguerra/alpine-kibana/)

## Tags
latest   elasticsearch 6.3.0
6.2.4    elasticsearch 6.2.4
6.1.1    elasticsearch 6.1.1
edge-apk elasticsearch 6.1.1
5.2.2    elasticsearch 5.2.2
5.0.0    elasticsearch 5.0.0
2.4.1    elasticsearch 2.4.1
2.4.0    elasticsearch 2.4.0
2.2      elasticsearch 2.2.2
2.2      elasticsearch 2.2
2.0      elasticsearch 2.0
1.6      elasticsearch 1.6

## Usage

```bash
docker run -p 9200:9200 -d danielguerrra/alpine-elasticsearch:6.2.4
docker run -d -v "$PWD/esdata":/usr/share/java/elasticsearch/data \
danielguerrra/alpine-elasticsearch"
```
