pipeline {
    agent any
    tools {
            nodejs 'nodejs21.2.0'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Backend') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                        sh 'mvn clean'
                    }
                }
            }
        }

        stage('Compile Backend') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                        sh 'chmod +x mvnw'
                        sh './mvnw compile'
                    }
                }
            }
        }

        stage('Test') {
            steps {
              script {
                    dir('DevOps_Project-Back') {
                        sh 'mvn test'
                    }
                }
                junit '**/target/surefire-reports/TEST-*.xml'
            }
        }
        stage('Build Frontend') {
            steps {
                script {
                    dir('DevOps_Project_Front') {
                        sh 'npm install'
                        sh 'npm run build'
                    }
                }
            }
        }
    }

}
