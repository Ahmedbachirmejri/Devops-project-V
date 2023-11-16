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

        /*stage('Nexus') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                        sh 'mvn deploy'
                    }
                }
            }
        }*/

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

        /*stage('Test') {
            steps {
              script {
                    dir('DevOps_Project-Back') {
                        sh 'mvn test'
                    }
                }
                junit '**/   /*target/surefire-reports/TEST-*.xml'
            }
        }*/
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

        stage('Build Backend Docker Image') {
            steps {
                script {
                    sh 'docker build -t ahmedbachir/devops-backend:latest -f Dockerfile .'
                }
            }
        }



        stage('Push Docker Images to Docker Hub') {
            steps {
                script {

                    sh 'docker login -u ahmedbachir -p mejri9876543210'
                    

                    sh 'docker push ahmedbachir/devops-backend:latest'
                    
                }
            }
        }
    }

}
