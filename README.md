# gitlab-ci-sonarqube

Docker image that combines [sonnar-scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner), [sonar-gitlab-plugin](https://github.com/gabrie-allaigre/sonar-gitlab-plugin) and [sonar-gate-breaker](https://github.com/gabrie-allaigre/sonar-gate-breaker) to integrate SonarQube quality gates with Gitlab CI and break pipelines when the Quality Gate does not pass.

Tested with Sonarqube 7.3 and Gitlab 11.3.5.

## Configuration

### In Sonarqube

If not installed yet, install [sonar-gitlab-plugin](https://github.com/gabrie-allaigre/sonar-gitlab-plugin) in your Sonarqube server, and follow the instructions to configure it](https://github.com/gabrie-allaigre/sonar-gitlab-plugin#configuration).

### In your project

As with [sonnar-scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner), you will need to have a `sonar.properties` file in your project's root folder.

To run the scan, add the following to your `gitlab-ci.yml`

```yml
quality:
  image: jramcast/gitlab-ci-sonarqube
  stage: test
  env:
    SONAR_URL: '...',
    SONAR_LOGIN: 'sonarqube login token'
  script:
    - sonar-scanner-preview # you can add other sonar options e.g: -Dsonar.projectVersion=${CI_COMMIT_SHA}
    - sonar-scanner # you can add other sonar options e.g: -Dsonar.projectVersion=${CI_COMMIT_SHA}
```

`sonar-scanner-preview` launchs a scan in **preview** mode (no publication in Sonarqube is done), generating inline comments in gitlab for the current commit.

`sonar-scanner` publishes a scan in Sonarqube. If the scan does not pass your Sonarqube Quality Gate, the `sonar-scanner` command with exit with non-zero status, breaking your pipeline.
