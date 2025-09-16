pipeline{
    aganet any

    stages {
        stage ('checkout') {
            steps {
                git branch: 'main',
                    url: "https://github.com/iamajjayya/ci-cd.git"
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t ci-cd-demo:latest .'
            }
        }

        stage('Test') {
            steps {
                echo "Running basic tests"
                writeFile file: "test-report.txt, text:"All tests skipped""
                archiveArtifacts artifacts: "test-report.txt", followSymlinks: false
            }
        }

        stage('Deploying to staging') {
            steps {
                input message: "Deploy to staging", ok: "Yes, Deploy"
                bat "docker run -d -p 8089 --name staging-3 ci-cd-demo:latest"
            }
        }

        stage('Deploying to production') {
            steps {
                input message: "Deploy to production", ok: "Yes deploy"
                bat "docker run -d -p 8090:80 --name production-4 ci-cd-demo:latest"
            }
        }
    }


    post {
        success {
            echo "Pipeline executed successfully"
            mail to: "ajjayya2002@gmail.com"
                subject: "SUCCESS: Jenkins Pipeline [${env.JOB_NAME}] #${env.BUILD_NUMBER}"
                body:  """
                    Hello Teams
                    
                    Pipeline *${env.JOB_NAME}* (Build #${env.BUILD_NUMBER}) Completed Succesfully .

                    You can check details here: ${env.BUILD_URL}

                Regards,
                Jenkins - Ajjayya    
                   
                 """

        }
          failure {
            echo "Pipleline Failed"
            mail to: "ajjayya2002@gmail.com"
                subject: "FAILED: Jenkins Pipeline [${env.JOB_NAME}] #${env.BUILD_NUMBER}"
                body:  """
                    Hello Teams
                    
                    Pipeline *${env.JOB_NAME}* (Build #${env.BUILD_NUMBER}) Completed Succesfully .

                    You can check details here: ${env.BUILD_URL}

                Regards,
                Jenkins - Ajjayya    
                   
                 """

        

          }
           always {
              echo "Archiving build logs and reports"
              archiveArtifacts artifacts: "**/*.log, **/*.txt" allowEmptyArchive: true
           }
    }
}