pipeline{
    agent any
    environment {
        DATABASE_URI = credentials("DATABASE_URI")
        SECRET_KEY = credentials("SECRET_KEY")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }
    stages{
        stage('SSH to test'){
            steps {
                sh "cd ~/.ssh"
                sh "ssh -i shh-aws-key ubuntu@34.244.66.96 -oStrictHostKeyChecking=no  << EOF"
                }
        }
        stage('Build'){
            steps {
                sh "docker-compose build --parallel"
            }
        }
        stage('Test'){
            steps {
                sh "pytest --cov application"
            }
        } 
        stage('Deploy'){
            steps {
                sh "docker-compose up -d"
            }
        }
    }
}