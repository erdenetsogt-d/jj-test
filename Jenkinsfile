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
                sh 'go mod tidy'
            }
        }
        
        stage('Build') {https://github.com/erdenetsogt-d/jj-test/blob/main/Jenkinsfile
            steps {
                echo 'Compiling and building'
                sh 'go mod tidy'
                sh 'go build'
            }

        }

        stage('docker build/push') {
            docker.withRegistry('https://registry-1.docker.io/v2/', 'b815ddb5-b528-4727-a597-508c12a7ecda') {
                def app = docker.build("erdee/docker-nodejs-demo:${commit_id}", '.').push()
     }
     }
        
    }

}
