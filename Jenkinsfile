pipeline {
    agent any
    environment{
        DATABASE_URI = credentials("DATABASE_URI")
        DOCKER_USERNAME = "jasminedhaliwal95"
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }
    stages{
        stage("Install Dependencies"){
            steps {
                sh "bash install-dependencies.sh"
            }
        }
        stage("Build"){
            steps{
                sh "docker-compose build --parallel"
            }
        }
        stage("Push"){
            steps{
                sh "docker-compose push"
            }
        }
        stage("Deploy"){
            steps{
                sh "docker-compose up -d"
            }
        }
    }
}
