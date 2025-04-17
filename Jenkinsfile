pipeline {
    agent { docker { image 'golang:1.22' } }
      stages {
        stage('Build and test') {
      steps {
        sh 'cd services/billing'
        sh 'go get ./...'
        sh 'gofmt -l .'
        sh 'go test ./...'
      }
    }
  }
}
