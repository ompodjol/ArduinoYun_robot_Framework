/* Jenkinsfile main branch */
import hudson.model.*

pipeline {
  agent any

  environment {
    PATH = "/opt/homebrew/bin/python3"
  }
  
  stages {
    stage('Read ENV') {
      steps {
        script {
          echo sh(script: 'env|sort', returnStdout: true)
        }
      }
    }
    stage('Read Console') {
      steps {
        script {
          echo "${BUILD_URL}console"
        }
      }
    }
    stage('Create Python Virtual Environment') {
      steps {
        script {
          // Create a directory for the virtual environment
          sh 'mkdir -p venv'
          // Create a Python virtual environment using venv
          sh 'python3 -m venv venv'
          // Activate the virtual environment
          sh 'source venv/bin/activate'
          // Install necessary Python packages in the virtual environment
          sh 'pip install -r requirements.txt'  // Replace with your requirements file
         }
      }
    }
    stage('Run Python Script') {
      steps {
        script {
          // Activate the virtual environment before running Python scripts
          sh 'source venv/bin/activate'
          // Run your Python script
          sh 'python my_script.py'  // Replace with your Python script
        }
      }
    }
    stage('compile cpp hello') {
      steps {
        dir('cplusplus') {
          script {
            sh "pwd"
            sh "ls -al"
            sh "g++ HelloWorld.cpp"
          }
        }
      }
    }
    stage('run cpp hello') {
      steps {
        dir('cplusplus') {
          script {
            sh "pwd"
            sh "ls -al"
            sh "./a.out"
          }
       }
      }
    }
    stage('Run Robot Framework Tests') {
      steps {
        script {
          // Run the Robot Framework test suite
          sh 'robot test_suite.robot'
        }
      }
    }
  }
}
