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
                sh "ssh -t -i /home/jenkins/.ssh/id_rsa ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF"
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