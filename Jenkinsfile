pipeline {
    agent any
    tools {
            nodejs 'nodejs21.2.0'
    }
    environment {
        registry = "ahmedbachir/devops-backend"
        registryCredential = 'ahmedbachir-dockerhub'
        dockerImage = ''
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
                        sh 'mvn install'
                    }
                }
            }
        }

        /*stage('Test Backend') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                    sh 'mvn test'
                    }
                    
                }
            }
        }*/

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
        /*
        stage('Build Frontend') {
            steps {
                script {
                    dir('DevOps_Project_Front') {
                        sh 'npm install'
                        sh 'npm run build'
                    }
                }
            }
        }*/

        stage("Docker build backend") {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
        }



        stage('Push Docker Images to Docker Hub') {
            steps {
                
                    sh 'docker push ahmedbachir/devops-backend:latest'
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    sh "docker rmi $registry:$BUILD_NUMBER"
                    
                
            }
        }
    }

}
