#!groovy

node {
    stage "Prepare environment"
        checkout scm
        def environment  = docker.build 'golang-node'

        environment.inside {
            stage "Configure and run tests"
              sh "go get -d -v -t && go test --cover -v ./..."

            stage "Build Executable"
              sh "go build -v -o go-test"
        }

    stage "Cleanup"
        deleteDir()
}
