pipeline {
    agent {
        docker { image 'registry.semaphoreci.com/golang:1.22' }
    }
    stages {
        stage('Lint') {
            steps {
                sh 'cd services/billing; go get ./...'
                sh 'cd services/billing; gofmt -l .'
            }
        }
    }
}

