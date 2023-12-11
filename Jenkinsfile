/* Jenkinsfile main branch */
import hudson.model.*

pipeline {
  agent any

  environment {
    PATH = "/Library/Frameworks/Python.framework/Versions/3.10/bin/:/opt/homebrew/bin/:$PATH"
    CREDENTIALS = "/home/jollyjae/credentials.py"
  }
  
  stages {
    stage('Read ENV') {
      steps {
        cleanWs()
        checkout scm
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
          // Create a Python virtual environment using venv
            // Activate the virtual environment
            // Install necessary Python packages in the virtual environment
          sh """
            sudo su
            mkdir -p venv
            python3 -m venv venv
            source venv/bin/activate
            pip install -r requirements.txt
          """
         }
      }
    }
    /*
    stage('Run Python Script') {
      steps {
        script {
          // Activate virtual environment before running Python scripts
          // Run Python script
          sh """
            source venv/bin/activate
            python3 pythonscripts/HelloWorld.py
          """
        }
      }
    }
    stage('Compile CPP Hello') {
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
    stage('Run CPP Hello') {
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
    */
    stage('Run Robot Framework Tests') {
      steps {
        script {
          // Run the Robot Framework test suite
          sh """
            sudo su
            cp ${CREDENTIALS} robots/.
            robot --loglevel=TRACE robots/test_suite.robot
          """
        }
      }
      post {
        always {
          step([
            $class              : 'RobotPublisher',
            outputPath          : '/Users/jollyjae/.jenkins/workspace/ArduinoYun_develop',
            outputFileName      : "output.xml",
            reportFileName      : 'report.html',
            logFileName         : 'log.html',
            disableArchiveOutput: false,
            passThreshold       : 95.0,
            unstableThreshold   : 95.0,
            otherFiles          : "**/*.png",
          ])
        }
      }
    }
  }
}
