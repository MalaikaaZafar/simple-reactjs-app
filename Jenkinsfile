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
                    dockerImage = docker.build("my-image:${env.BUILD_ID}")
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    dockerImage.run("-p 3000:3000")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        dockerImage.push("my-image:${env.BUILD_ID}")
                    }
                }
            }
        }
    }
}