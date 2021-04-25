pipeline{
    agent any
    environment {
        DATABASE_URI = credentials("DATABASE_URI")
        SECRET_KEY = credentials("SECRET_KEY")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }
    stages{
        stage('Clean up workspace'){
            steps {
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF
                      rm -r jdayih_assessment
                      docker system prune -a
EOF'''
            }
        }
        stage('Clone repo'){
            steps {
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF
                      git clone --branch dev git@github.com:QACTrainers/jdayih_assessment.git
EOF'''
            }
        }
        stage('Build'){
            steps {
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF
                      cd jdayih_assessment
                      export DATABASE_URI=$DATABASE_URI
                      export SECRET_KEY=$SECRET_KEY
                      docker-compose build --parallel
EOF'''
            }
        }
        stage('Deploy'){
            steps {
                sh '''ssh -T -i '/home/jenkins/.ssh/id_rsa' ubuntu@54.154.218.99 -oStrictHostKeyChecking=no  << EOF
                      cd jdayih_assessment
                      export DATABASE_URI=$DATABASE_URI
                      export SECRET_KEY=$SECRET_KEY
                      docker-compose up -d
EOF'''
            }
        }
    }
}