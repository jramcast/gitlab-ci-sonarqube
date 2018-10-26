FROM openjdk:8-jre-slim

COPY ./tools/ /opt/gitlab-ci-sonarqube/

RUN ln -s /opt/gitlab-ci-sonarqube/scan /bin/scan

ENV TOOLS_PATH "/opt/gitlab-ci-sonarqube"

CMD ["quality-gate"]