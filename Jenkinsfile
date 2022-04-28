
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
        
        stage('Build') {
            steps {
                echo 'Compiling and building'
                sh 'go mod tidy'
                sh 'go build main.go'
                sh './main'
            }

        }


        
    }

}
