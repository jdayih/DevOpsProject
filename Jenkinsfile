pipeline{
    agent any
    environment {
        DATABASE_URI = credentials("DATABASE_URI")
        SECRET_KEY = credentials("SECRET_KEY")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }
    stages{
        stage('Clone repo and build'){
            steps {
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF
EOF'''
            }
        }
        stage('Build'){
            steps {
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF
                      cd jdayih_assessment
                      export DATABASE_URI=credentials("DATABASE_URI")
                      export SECRET_KEY=credentials("SECRET_KEY")
                      docker-compose build --parallel
EOF'''
            }
        }
        stage('Deploy'){
            steps {
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF
                      cd jdayih_assessment
                      docker-compose up -d
EOF'''
            }
        }
    }
}