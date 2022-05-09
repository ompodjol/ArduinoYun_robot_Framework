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
    stage('build') {
      steps {
        script {
          sh 'make'
        }
      }
    }
  }
}
