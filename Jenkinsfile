pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/YOUR-USERNAME/ci-cd-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ci-cd-demo:latest .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running basic tests (skip for now)'
            }
        }

        stage('Deploy to Staging') {
            steps {
                sh 'docker run -d -p 8081:80 --name staging ci-cd-demo:latest || true'
            }
        }

        stage('Deploy to Production') {
            input {
                message "Deploy to Production?"
                ok "Yes, deploy"
            }
            steps {
                sh 'docker run -d -p 8082:80 --name production ci-cd-demo:latest || true'
            }
        }
    }
}
