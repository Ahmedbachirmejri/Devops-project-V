pipeline {
    agent any
    tools {
            nodejs 'nodejs21.2.0'
    }
    environment {
    registry = "docker.io/library/devops_back_end"
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

       /* stage('Nexus') {
            steps {
                script {
                    dir('DevOps_Project-Back') {
                         sh "mvn deploy -DskipTests=true"
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

        stage('SonarQube') {
            steps {
                script {
                    def scannerHome = tool name: 'Sonar_devops', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    withSonarQubeEnv('Sonar_devops') {
                        // Run Maven command with SonarQube analysis
                        sh "mvn clean verify sonar:sonar \
                            -Dsonar.projectKey=Devops-project-V \
                            -Dsonar.projectName='Devops-project-V' \
                            -Dsonar.host.url=http://10.0.2.15:9000 \
                            -Dsonar.token=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"
                    }
                }
            }
        }

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

    /*  stage("Docker build backend") {
    steps {
        script {
            dockerImage = docker.build "$registry:$BUILD_NUMBER"
        }
    }
}*/


   /*stage('Push Docker Images to Docker Hub') {
    steps {
        script {
            docker.withRegistry('', registryCredential) {
                dockerImage.push()
                sh "docker tag $registry:$BUILD_NUMBER ahmedbachir/devops-backend:latest"
                sh 'docker push ahmedbachir/devops-backend:latest'
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}*/

}
}
