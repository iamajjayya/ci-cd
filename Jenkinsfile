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
            input {
                message "Deploy to staging"
                ok "Yes, Deploy"
            }
            bat "docker run -d -p 8084:80 --name staging ci-cd-demo:1.1.1 || exit 0"
        }

        stage ("Deploy to production") {
            input {
                message "Deploy to Production"
                ok "Yes deploy"
            }
            bat "dcoekr run -d -p 8085:80 --name production ci-cd-demo:1.1.1 || exit 0"
        }
    }
}
