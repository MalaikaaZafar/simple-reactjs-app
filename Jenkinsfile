pipeline {
    agent any

     tools {
        nodejs 'NodeJSInstall'
        dockerTool 'dockerInstall'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/MalaikaaZafar/simple-reactjs-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

                stage('Build Docker Image') {
                    steps {
                        script {
                            bat 'docker build -t myapp .'
                        }
                    }
                }

                stage('Run Docker Image') {
                    steps {
                        script {
                            bat 'docker run -p 3000:3000 myapp'
                        }
                    }
                }

                stage('Push Docker Image') {
                    steps {
                        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                            bat 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
                            bat 'docker push myapp'
                        }
                    }
                }
            }
        }