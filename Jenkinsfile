pipeline {
    agent {
        docker { image 'registry.semaphoreci.com/golang:1.22' }
    }

    environment {
        HOME = "/tmp/build"
      }

    stages {
        stage('Lint') {
            steps {
                sh 'mkdir -p $HOME'
                sh 'cd services/billing; go get ./...'
                sh 'cd services/billing; gofmt -l .'
            }
        }
        stage('Test') {
            steps {
                sh 'mkdir -p $HOME'
                sh 'cd services/billing; go get ./...'
                sh 'cd services/billing; go test ./...'
            }
        }    
    }
}

