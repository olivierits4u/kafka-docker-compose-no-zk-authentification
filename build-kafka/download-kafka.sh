#!/bin/sh -e
MAJOR_VERSION=$(echo "$KAFKA_VERSION" | cut -d. -f1)
export MAJOR_VERSION

MINOR_VERSION=$(echo "$KAFKA_VERSION" | cut -d. -f2)
export MINOR_VERSION
FILENAME="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.cgi?path=/kafka/${KAFKA_VERSION}/${FILENAME}&as_json=1" | jq -r '"\(.preferred)\(.path_info)"')
if [ ! "$(curl -f -s -r 0-1 "${url}")" ]; then
    echo "Mirror does not have desired version, downloading direct from Apache"
    url="https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/${FILENAME}"
fi
echo "Downloading Kafka from $url"
wget "${url}" -O "/tmp2/${FILENAME}"
