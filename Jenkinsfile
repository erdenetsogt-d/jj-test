node {
   def commit_id
   stage('Preparation') {
     checkout scm
     sh "git rev-parse --short HEAD > .git/commit-id"                        
     commit_id = readFile('.git/commit-id').trim()
   }
   stage('test') {
     nodejs(nodeJSInstallationName: 'nodejs') {
       sh 'npm install --only=dev'
       sh 'npm test'
     }
   }
   stage('docker build/push') {
     docker.withRegistry('https://registry-1.docker.io/v2/', 'b815ddb5-b528-4727-a597-508c12a7ecda') {
       def app = docker.build("erdee/docker-nodejs-demo:${commit_id}", '.').push()
     }
   }
}
