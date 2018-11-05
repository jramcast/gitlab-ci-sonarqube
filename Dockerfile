FROM openjdk:8-jre-slim

# Install nodejs
RUN apt-get update -q && \
    apt-get install -y -q curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

COPY ./tools/ /opt/gitlab-ci-sonarqube/

RUN ln -s /opt/gitlab-ci-sonarqube/sonar-scanner /bin/sonar-scanner

RUN ln -s /opt/gitlab-ci-sonarqube/sonar-scanner-preview /bin/sonar-scanner-preview

ENV TOOLS_PATH "/opt/gitlab-ci-sonarqube"

WORKDIR /code

CMD ["sonar-scanner"]