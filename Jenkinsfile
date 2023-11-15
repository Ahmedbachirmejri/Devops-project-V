pipeline {
    agent any

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
                        sh 'chmod +x mvnw'
                        sh './mvnw clean install'
                    }
                }
            }
        }

        stage('Build Frontend') {
            steps {
                script {
                    dir('DevOps_Project_Front') {
                        sh 'npm install'
                        sh 'ng build'
                    }
                }
            }
        }

        stage('Package') {
            steps {
                script {
                    archiveArtifacts artifacts: [
                        'DevOps_Project-Back/target/*.jar',
                        'DevOps_Project_Front/dist/*'
                    ], fingerprint: true
                }
            }
        }

    }

}
