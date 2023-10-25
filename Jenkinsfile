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
    stage('compile cpp hello') {
      dir('cplusplus') {
        steps {
          script {
            sh "pwd"
            sh "ls -al"
            sh "g++ HelloWorld.cpp"
          }
        }
      }
    }
    stage('run cpp hello') {
      dir('cplusplus') {
        steps {
          script {
            sh "pwd"
            sh "ls -al"
            sh "./a.out"
          }
        }
      }
    }
  }
}
