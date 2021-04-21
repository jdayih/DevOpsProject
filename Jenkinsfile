pipeline{
    agent any
    environment{
        MYSQL_ROOT_PASSWORD = credentials("MYSQL_ROOT_PASSWORD")
        DOCKER_USERNAME = "jasminedhaliwal95"
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }
    stages{
                stage("Install Dependencies"){
            steps {
                script {
                    if (env.install_dependencies == 'true') {
                            sh "bash install-dependencies.sh"
                    }
                }
            }
        stage("Build"){
            sh "docker-compose build --parallel"
        }
        stage("Push"){
            sh "docker-compose push"
        }
        stage("Deploy"){
            sh "docker-compose up -d"
        }
    }
}
