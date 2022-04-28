pipeline {
    agent any
    tools {
        go 'go1.18.1'
    }
    environment {
        GO114MODULE = 'on'
        CGO_ENABLED = 0 
        GOPATH = "${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}"
    }
    stage('Preparation') {
     checkout scm
     sh "git rev-parse --short HEAD > .git/commit-id"                        
     commit_id = readFile('.git/commit-id').trim()
   }
    stages {        
        stage('Pre Test') {
            steps {
                echo 'Installing dependencies'
                sh 'go version'
                sh 'go get -u golang.org/x/lint/golint'
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

        stage('Test') {
            steps {
                withEnv(["PATH+GO=${GOPATH}/bin"]){
                    echo 'Running vetting'
                    sh 'go vet .'
                    echo 'Running linting'
                    sh 'golint .'
                    echo 'Running test'
                    sh 'cd test && go test -v'
                }
            }
        }
        stage('docker build/push') {
            docker.withRegistry('https://registry-1.docker.io/v2/', 'b815ddb5-b528-4727-a597-508c12a7ecda') {
                def app = docker.build("erdee/docker-nodejs-demo:${commit_id}", '.').push()
     }
     }
        
    }

}
