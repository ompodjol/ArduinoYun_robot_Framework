/* Jenkinsfile main branch */

pipeline {
  agent any
  
  stages {
    stage('read env') {
      steps {
        script {
          echo sh(script: 'env|sort', returnStdout: true)
        }
      }
    }
    stage('read console') {
      steps {
        script {
          echo "${BUILD_URL}/consoleText"
        }
      }
    }
    stage('check failure in console ') {
      steps {
        wget '${BUILD_URL}/consoleText'
      }
    }
  }
}
