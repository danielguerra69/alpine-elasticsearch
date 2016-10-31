#!/bin/sh

# CONF_FILE setting was removed
if [ ! -z "$CONF_FILE" ]; then
    echo "CONF_FILE setting is no longer supported. elasticsearch.yml must be placed in the config directory and cannot be renamed."
    exit 1
fi
#/usr/share/elasticsearch/bin # cat elasticsearch.in.
#elasticsearch.in.bat  elasticsearch.in.sh
#/usr/share/elasticsearch/bin # cat elasticsearch.in.
#elasticsearch.in.bat  elasticsearch.in.sh
#/usr/share/elasticsearch/bin # cat elasticsearch.in.sh

# check in case a user was using this mechanism
if [ "x$ES_CLASSPATH" != "x" ]; then
    cat >&2 << EOF
Error: Don't modify the classpath with ES_CLASSPATH. Best is to add
additional elements via the plugin mechanism, or if code must really be
added to the main classpath, add jars to lib/ (unsupported).
EOF
    exit 1
fi

ES_CLASSPATH="$ES_HOME/lib/elasticsearch-5.0.0.jar:$ES_HOME/lib/*"
