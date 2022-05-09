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
        echo "${BUILD_URL}/consoleText"
        sh "curl ${BUILD_URL}/consoleText -o console.txt"
      }
    }
    stage('CheckLog') {
      steps {
        if (manager.logContains('.*myTestString.*')) {
          error("Build failed because of this and that..")    
        }
      }
    }
  }
}
