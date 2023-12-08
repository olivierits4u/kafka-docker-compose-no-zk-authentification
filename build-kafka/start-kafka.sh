#!/bin/sh -e
CLUSTER_UUID=`/opt/kafka/bin/kafka-storage.sh random-uuid`
/opt/kafka/bin/kafka-storage.sh format -t ${CLUSTER_UUID} -c /opt/kafka/config/server.properties --ignore-formatted
cat /opt/kafka/config/server.properties | grep "node.id"  > /kafka/logs/meta.properties
echo "version=1" >> /kafka/logs/meta.properties
echo "cluster.id=theCluster" >> /kafka/logs/meta.properties
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties 
