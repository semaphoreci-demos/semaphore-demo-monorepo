pipeline {

    agent none

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
                        sh 'cd services/billing && go get ./...'
                        sh 'cd services/billing && go test ./...'
                    }
                }    
            }
        }

        stage('UI service') {
            parallel {
                stage('Lint') {
                    agent {
                        docker { image 'registry.semaphoreci.com/elixir:1.17' }
                    }
                    steps {
                        sh 'mkdir -p $HOME'
                        sh 'cd services/ui && mix local.hex --force && mix local.rebar --force && mix deps.get && mix deps.compile'
                        sh 'cd services/ui && mix credo'
                    }
                }
                stage('Test') {
                    agent {
                        docker { image 'registry.semaphoreci.com/elixir:1.17' }
                    }
                    steps {
                        sh 'mkdir -p $HOME'
                        sh 'cd services/ui && mix local.hex --force && mix local.rebar --force && mix deps.get && mix deps.compile'
                        sh 'cd services/ui; mix test'
                    }
                }    
            }
        }

        stage('User service') {
            parallel {
                stage('Lint') {
                    agent {
                        docker { image 'registry.semaphoreci.com/ruby:2.7' }
                    }
                    steps {
                        sh 'mkdir -p $HOME'
                        sh 'cd services/users && bundle install'
                        sh 'cd services/users && bundle exec rubocop'
                    }
                }
                stage('Test') {
                    agent {
                        docker { image 'registry.semaphoreci.com/ruby:2.7' }
                    }
                    steps {
                        sh 'mkdir -p $HOME'
                        sh 'cd services/users && bundle install'
                        sh 'cd services/users && bundle exec ruby test.rb'
                    }
                }    
            }
        }

    }

}

