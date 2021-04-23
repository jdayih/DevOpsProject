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
                sh '''ssh -vvv 3.250.184.0 -oStrictHostKeyChecking=no << EOF
                      echo 'hello'
                      EOF'''
            }
        }
        stage('Build'){
            steps {
                sh "docker-compose build --parallel"
            }
        }
        stage('Deploy'){
            steps {
                sh "docker-compose up -d"
            }
        }
    }
}