pipeline {

  agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }

  stages {
      
    stage('Clean Workspace'){
      steps {
        cleanWs()
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
}
    