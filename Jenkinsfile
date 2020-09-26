pipeline {

  agent {
        docker {
            image 'node:10-alpine'
            args '-p 3000:3000'
        }
    }

  environment {
        EMAIL_TO = 'taleleyashwant@gmail.com'
  }

  stages {
    stage('Clean Workspace'){
      steps {
        cleanWs()
      }
    }

    stage ('checkout'){
      steps{
        checkout scm
      }
    }

    stage('Restore') {
        steps {
            sh 'npm install'
        }
    }

    stage('Build') {
        steps {
          sh 'npm run build'
        }
    }
    
    
  }

   post {
        always {  
             echo 'This will always run'  
        }  
         success {  
             emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
                    to: "${EMAIL_TO}", 
                    subject: 'Build Sucessful in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
        }

        failure {
            emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
                    to: "${EMAIL_TO}", 
                    subject: 'Build failed in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
        }

        unstable {
            emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
                    to: "${EMAIL_TO}", 
                    subject: 'Unstable build in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
        }

        changed {
            emailext body: 'Check console output at $BUILD_URL to view the results.', 
                    to: "${EMAIL_TO}", 
                    subject: 'Jenkins build is back to normal: $PROJECT_NAME - #$BUILD_NUMBER'
        }
    }
}
    