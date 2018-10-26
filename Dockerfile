FROM openjdk:8-jre-slim

COPY ./tools/ /opt/gitlab-ci-sonarqube/

RUN ln -s /opt/gitlab-ci-sonarqube/quality-gate /bin/quality-gate

RUN ln -s /opt/gitlab-ci-sonarqube/preview-issues /bin/preview-issues

ENV TOOLS_PATH "/opt/gitlab-ci-sonarqube"

WORKDIR /code

CMD ["quality-gate"]