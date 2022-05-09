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
    stage('capture console output') {
      steps {
        script {
          def directory = "${env.WORKSPACE}/read_console" // change name here
          def logContent = Jenkins.getInstance().getItemByFullName(env.JOB_NAME).getBuildByNumber(Integer.parseInt(env.BUILD_NUMBER)).logFile.text
          // copy the log in the job's own workspace
          writeFile file: directory + "/buildConsolelog.txt",
          text: logContent
        }
        def consoleOutput = readFile directory + '/buildConsolelog.txt'
        echo 'Console output saved in the buildConsolelog file'
        echo '--------------------------------------'
        echo consoleOutput
        echo '--------------------------------------'
      }
    }
  }
}
