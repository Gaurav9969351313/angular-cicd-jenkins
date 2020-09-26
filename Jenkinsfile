pipeline {

  agent {
        docker { image 'node:10-alpine' }
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
    