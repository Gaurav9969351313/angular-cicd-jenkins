pipeline {

  agent any;

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
    