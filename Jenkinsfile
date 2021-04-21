pipeline {
    agent any
    environment{
        DATABASE_URI = credentials("DATABASE_URI")
        DOCKER_USERNAME = "jasminedhaliwal95"
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
        install_dependencies = false
    }
    stages{
        stage("Install Dependencies"){
            steps {
                sh '''sudo apt update
                sudo apt install curl -y
                curl https://get.docker.com | sudo bash
                sudo usermod -aG docker jenkins
                sudo apt install -y curl jq
                version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                sudo chmod +x /usr/local/bin/docker-compose
                echo $DOCKER_PASSWORD | docker login --username jasminedhaliwal95 --stdin-password'''
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
