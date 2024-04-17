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
                sh 'npm install'
            }
        }

                stage('Build Docker Image') {
                    steps {
                        script {
                            sh 'docker build -t myapp .'
                        }
                    }
                }

                stage('Run Docker Image') {
                    steps {
                        script {
                            sh 'docker run -p 3000:3000 myapp'
                        }
                    }
                }

                stage('Push Docker Image') {
                    steps {
                        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                            sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
                            sh 'docker push myapp'
                        }
                    }
                }
            }
        }