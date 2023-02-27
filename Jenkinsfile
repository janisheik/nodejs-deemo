pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('34b7b344-8e63-4907-b9da-9d2dd4409097')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/janisheik/nodejs-deemo.git'
            }
        }

        stage('Build docker image') {
            steps { 
                sh 'docker build -t jani180348/nodeapp:latest .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push jani180348/nodeapp:latest'
            }
        }
        stage('docker run') {
            steps{
                sh 'docker run -t -d name nodeapp'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}

