#!/bin/sh

set -e
# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
	chown -R elastico:elastico /usr/share/elasticsearch/data
  echo "$@" > /bin/elastico
  chmod a+x /bin/elastico
	set -- su - elastico -s /bin/sh -c elastico
	#exec su elasticsearch "$BASH_SOURCE" "$@"
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
