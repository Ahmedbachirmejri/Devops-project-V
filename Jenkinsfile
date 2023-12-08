pipeline {
    agent any
    tools {
            nodejs 'nodejs21.2.0'
    }
    environment {
      DOCKERHUB_CREDENTIALS = credentials('ahmedbachir-dockerhub')
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

        stage('Test Backend') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                    sh 'mvn test'
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
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                    sh 'docker build -t devops_back_end .'
                    sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                }
            }
        }

        stage('Login') {
            steps {
                
                    sh 'echo DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                
            }
        }


        stage('Push Docker Images to Docker Hub') {
            steps {
                
                    sh 'docker push ahmedbachir/devops-backend:latest'
                    
                
            }
        }
    }

}
