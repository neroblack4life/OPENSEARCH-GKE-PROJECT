FROM opensearchproject/logstash-oss-with-opensearch-output-plugin:8.9.0

COPY logstash-config/logstash.conf /usr/share/logstash/pipeline/logstash.conf
# COPY logstash-config/pipeline.yaml /usr/share/logstash/pipeline/pipeline.yaml
COPY keys/gcp-credentials.json /etc/logstash/gcp-credentials.json

RUN bin/logstash-plugin install logstash-input-google_pubsub

USER logstash

CMD ["logstash", "-f", "/usr/share/logstash/pipeline/logstash.conf"]