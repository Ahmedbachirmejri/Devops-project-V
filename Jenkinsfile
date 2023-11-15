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
                        sh 'mvn compile'
                    }
                }
            }
        }

        stage('Compile Backend') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                        sh 'mvn clean'
                    }
                }
            }
        }

        stage('Test') {
            steps {
              script {
                    dir('DevOps_Project-Back') {
                        sh './mvnw test'
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
