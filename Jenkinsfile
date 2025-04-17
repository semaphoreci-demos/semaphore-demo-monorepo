pipeline {
    environment {
        HOME = "/tmp/build"
      }

    stages {
        stage('Billing service') {
            parallel {
                stage('Lint') {
                    agent {
                        docker { image 'registry.semaphoreci.com/golang:1.22' }
                    }
                    steps {
                        sh 'mkdir -p $HOME'
                        sh 'cd services/billing; go get ./...'
                        sh 'cd services/billing; gofmt -l .'
                    }
                }
                stage('Test') {
                    agent {
                        docker { image 'registry.semaphoreci.com/golang:1.22' }
                    }
                    steps {
                        sh 'mkdir -p $HOME'
                        sh 'cd services/billing; go get ./...'
                        sh 'cd services/billing; go test ./...'
                    }
                }    
              }
          }
    }
}

