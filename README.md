# Golang web service testing

This is a basic repository with a vanilla Golang web server, the goal is to have an example application that I can use as a test case in Jenkins. The goal is to set up a Jenkins pipeline that checks out the code, builds the web application, runs appropriate tests and reports on success/failure.

I am usign the following components:

* Docker container based on the official golang image to build and run the golang app and tests
* Jenkinsfile to describe the jenkins test pipeline to be run

## Using Docker

    # Build the docker image
    > docker build -t go-test .
    > docker run -it -d -p 8000:8000 --rm --name go-test go-test

    # Access the app on localhost:8000

    # When finished, shut down the app
    > docker stop go-test

## Testing using docker-compose

Docker compose is used to define the base Golang images, load any required packages and then run gotest and coverage commands, if everything passes, build the go-test binary

    # Run the tests and build go-test
    > docker-compose -f docker-compose-test-local.yml run --rm unit

    === RUN   TestYourHandler
    --- PASS: TestYourHandler (0.00s)
    PASS
    coverage: 25.0% of statements
    ok  	_/usr/src/myapp	0.005s
    github.com/gorilla/context
    github.com/gorilla/mux
    _/usr/src/myapp
