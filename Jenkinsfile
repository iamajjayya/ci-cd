pipeline {
    agent any

    stages{
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: "https://github.com/iamajjayya/ci-cd.git"
            }
        }

        stage('Build Docker image') {
            steps {
                bat 'docker build -t ci-cd-demo:latest .'
            }
        }

        stage('Test') {
            steps {
                echo "Running basic tests (skip for now)"
            }
        }

        stage (" Deploying to staging") {
            steps {
            input message: "Deploy to staging", ok: "Yes, Deploy"
            
            bat "docker run -d -p 8084:80 --name staging-1 ci-cd-demo:latest || exit 0"
        }}

        stage ("Deploy to production") {
            steps {
            input message: "Deploy to Production", ok: "Yes deploy"
            
            bat "docker run -d -p 8085:80 --name production ci-cd-demo:latest || exit 0"
        }}
    }
}
