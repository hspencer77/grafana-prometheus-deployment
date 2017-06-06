
FROM grafana/grafana
LABEL maintainer "Harold Spencer Jr. <hspencer77@gmail.com>"
COPY grafana_postconfig.sh /usr/local/bin/grafana_postconfig.sh
RUN apt-get update && apt-get install -y curl net-tools && \
    chmod +x /usr/local/bin/grafana_postconfig.sh
ENTRYPOINT ["/usr/local/bin/grafana_postconfig.sh"]


