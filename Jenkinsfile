pipeline {
    agent {
        docker { image 'node:22.14.0-alpine3.21' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --eval "console.log(process.platform,process.env.CI)"'
            }
        }
    }
}
