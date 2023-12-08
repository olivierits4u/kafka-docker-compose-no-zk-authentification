FROM registry.redhat.io/ubi8/ubi
RUN  yum update -y && yum install -y java-11-openjdk jq wget curl
ARG kafka_version=3.5.1
ARG scala_version=2.13
ARG vcs_ref=unspecified
ARG build_date=unspecified
ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_HOME=/opt/kafka
ENV PATH=${PATH}:${KAFKA_HOME}/bin
COPY download-kafka.sh start-kafka.sh  /tmp2/
RUN    chmod a+x /tmp2/*.sh ; \
    mv /tmp2/start-kafka.sh   /usr/local/bin; \
    sync ; \
    /tmp2/download-kafka.sh ; \
    tar xfz /tmp2/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt ; \
    rm /tmp2/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz ; \
    ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME} ; \
    rm -rf /tmp2 ; 
CMD /usr/local/bin/start-kafka.sh

