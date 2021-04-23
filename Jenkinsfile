pipeline{
    agent any
    environment {
        DATABASE_URI = credentials("DATABASE_URI")
        SECRET_KEY = credentials("SECRET_KEY")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }
    stages{
        stage('SSH'){
            steps {
                sh "ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF"
            }
        }
        stage('Clone repo'){
            steps {
                sh "git clone https://github.com/QACTrainers/jdayih_assessment"
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