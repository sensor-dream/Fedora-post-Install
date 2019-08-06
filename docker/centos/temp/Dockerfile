FROM centos

MAINTAINER SDBS mailto:sensor-dream@sensor-dream.ru

LABEL "docker.sensor-dream.ru"="SBDS development"
LABEL docker.sensor-dream.ru.label-with-value="centos-lap"
LABEL version="0.0.1"
LABEL description="null containers"

ENV container=docker

ENTRYPOINT ["/sbin/init"]

CMD ["--log-level=info"]

STOPSIGNAL SIGRTMIN+3
