pipeline {
    agent any

     tools {
        nodejs 'NodeJSInstall'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/aditya-sridhar/simple-reactjs-app'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

                stage('Build Docker Image') {
                    steps {
                        script {
                            bat 'docker build -t my-image:%BUILD_ID% .'
                        }
                    }
                }
        
                stage('Run Docker Image') {
                    steps {
                        script {
                            bat 'docker run -p 3000:3000 my-image:%BUILD_ID%'
                        }
                    }
                }
        
                stage('Push Docker Image') {
                    steps {
                        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                            bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS% https://registry.hub.docker.com'
                            bat 'docker push my-image:%BUILD_ID%'
                        }
                    }
                }
            }
        }