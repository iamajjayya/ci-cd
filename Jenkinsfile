pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/iamajjayya/ci-cd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t ci-cd-demo:latest .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running basic tests (skip for now)'
            }
        }

        stage('Deploy to Staging') {
            steps {
                bat 'docker run -d -p 8081:80 --name staging ci-cd-demo:latest || exit 0'
            }
        }

        stage('Deploy to Production') {
            input {
                message "Deploy to Production?"
                ok "Yes, deploy"
            }
            steps {
                bat 'docker run -d -p 8082:80 --name production ci-cd-demo:latest || exit 0'
            }
        }
    }
}
