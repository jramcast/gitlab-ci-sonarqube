# gitab-ci-sonarqube

Docker image that combines [sonar-gitlab-plugin](https://github.com/gabrie-allaigre/sonar-gitlab-plugin) and [sonar-gate-breaker](https://github.com/gabrie-allaigre/sonar-gate-breaker) to integrate SonarQube quality gates with Gitlab CI and break pipelines when the Quality Gate does not pass.

Tested with Sonarqube 7.3 and Gitlab 11.3.5.

## Configuration

Add the following to your `gitlab-ci.yml`

```yml
quality:
  image: jramcast:gitlab-ci-sonarqube
  stage: test
  env:
    SONAR_URL: '...',
    SONAR_LOGIN: 'sonarqube login token'
  script:
    - quality-gate # you can add other sonar options e.g: -Dsonar.projectVersion=${CI_COMMIT_SHA}
```

If not installed yet, install [sonar-gitlab-plugin](https://github.com/gabrie-allaigre/sonar-gitlab-plugin) in your Sonarqube server, and follow the instructions to configure it](https://github.com/gabrie-allaigre/sonar-gitlab-plugin#configuration)