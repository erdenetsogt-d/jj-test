
pipeline {
    agent any
    tools {
        go '1.18.1'
    }
    environment {
      registry = "erdee/docker-nodejs-demo"
      dockerImage = ""
    }

    stages {        
        stage('Pre Test') {
            steps {
                echo 'Installing dependencies'
                sh 'go version'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Compiling and building'
                sh 'go mod tidy'
                sh 'go build'
                script {
                    dockerImage = docker.build(registry + ":go-websample$BUILD_NUMBER", "-f Dockerfile .")
                
                }
            }

        }
      stage('Push Image') {
        steps{
          script {
            docker.withRegistry('https://registry-1.docker.io/v2/', 'b815ddb5-b528-4727-a597-508c12a7ecda') {
              dockerImage.push()
                
            }
          }
        }
      }

    }

}
