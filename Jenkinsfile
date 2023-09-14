pipeline {
    agent any
    environment {
    NAME = "myapp"
    VERSION = "${env.BUILD_ID}"
    IMAGE = "${NAME}:${VERSION}"
    }
    stages {
        stage('Sent message about starting deploy') {
            steps {
                sh 'curl -s -X POST https://api.telegram.org/bot6061794557:AAG7GW-CCfu-z4hPZ5pffgOBgf4SGzhSvRw/sendMessage -d chat_id=-1001540507095 -d parse_mode="Markdown" -d text="Starting deploy"'
            }
        }
        stage('Build image') {
            steps {
                sh 'docker build -t ${IMAGE} .'
            }
        }
    
        stage('Recretate container') {
            steps {
                sh 'docker run --rm --name ${NAME}-${VERSION} -p 80:80 ${IMAGE}'
            }
        }

        stage('Test') {
            steps {
                sh 'curl 192.168.122.34:80'
            }
        }

        stage('Sent message about finishing deploy') {
            steps {
                sh 'curl -s -X POST https://api.telegram.org/bot6061794557:AAG7GW-CCfu-z4hPZ5pffgOBgf4SGzhSvRw/sendMessage -d chat_id=-1001540507095 -d parse_mode="Markdown" -d text="Success deploym"'
            }
        }

    }
  } 
