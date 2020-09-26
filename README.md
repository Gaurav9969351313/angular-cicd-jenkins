https://github.com/petenorth/angular-5-example/blob/master/jenkins/Jenkinsfile

https://github.com/hms-dbmi/avillachlab-jenkins/blob/master/jenkins-docker/Dockerfile
https://medium.com/@karthi.net/docker-tutorial-build-docker-images-using-jenkins-d2880e65b74
https://tutorials.releaseworksacademy.com/learn/building-your-first-docker-image-with-jenkins-2-guide-for-developers

Step 1: docker-compose up -d
Step 2: docker exec -it jenkins bash
Step 3: docker exec /var/jenkins_home/secrets/initialAdminPassword
Step 4: copy the token and unlock the jenkins and setup the username and password
Step 5: Home ==> manage jenkins ==> available ==>

install following plugins

Docker Pipeline
Docker
Email Extension Template

Step 6: Restart the jenkins or reload the jenkins
Step 7: Create the pipeline ==> Multibrach pipeline ==> Branch Sources ==> Select Github ==>
Click on Add (Dropdown will open) ==> Select Jenkins ==> Add Git Credentials
then add git repo url
Step 8: save
Step 9: Setting Up Email Notifications
Manage Jenkins ==> Configure System ==> E-mail Notification & Extended E-mail Notification
configure ith same credentials

SMTP Server: smtp.gmail.com
Use SMTP Authentication: Check this box (true)
User Name: gauravtalele@gmail.com
password: <Email Password>
Use SSL: true
SMTP Port: 465
Charset: utf-8

agent {
docker {
image 'node:10-alpine'
args '-p 3000:3000'
}
}

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

docker image build -t gauravtalele/angular-jenkins-cicd .
docker container run -d -p 8085:80 gauravtalele/angular-jenkins-cicd
