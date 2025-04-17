pipeline {
    agent {
        docker { image 'registry.semaphoreci.com/golang:1.22' }
    }
    stages {
        stage('Lint') {
            steps {
                sh 'ls'
                sh 'cd services/billing'
                sh 'ls'
                sh 'go get ./...'
                sh 'gofmt -l .'
            }
        }
    }
}

