/* Jenkinsfile main branch */
import hudson.model.*

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
          echo "${BUILD_URL}console"
        }
      }
    }
    stage('check failure in console ') {
      steps {
        echo "${BUILD_URL}console"
      }
    }
    stage('CheckLog') {
      steps {
        script {
          sh "wget -q --no-check-certificate -O build.log ${BUILD_URL}console"
        }
      }
    }
  }
}
