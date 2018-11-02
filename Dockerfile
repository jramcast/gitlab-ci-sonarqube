FROM openjdk:8-jre-slim

COPY ./tools/ /opt/gitlab-ci-sonarqube/

RUN ln -s /opt/gitlab-ci-sonarqube/sonar-scanner /bin/sonar-scanner

RUN ln -s /opt/gitlab-ci-sonarqube/sonar-scanner-preview /bin/sonar-scanner-preview

ENV TOOLS_PATH "/opt/gitlab-ci-sonarqube"

WORKDIR /code

CMD ["sonar-scanner"]