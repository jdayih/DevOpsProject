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
                sh '''ssh -i ~/.ssh/ansible_id_rsa 54.246.139.137 -oStrictHostKeyChecking=no << EOF
                      echo 'hello'
                      EOF'''
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