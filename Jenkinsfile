pipeline {
    agent any
    environment {
        GIT_CREDENTIALS = credentials('http')
    }
    stages {
        stage('Create and Push test.sh') {
            steps {
                sh '''
                    #!/bin/sh -e
                    cd $WORKSPACE
                    mkdir -p tmp
                    cd tmp
                    git clone -b main https://${GIT_CREDENTIALS}@github.com/VishalBaghla/test.git
                    ls -ltr
                    cd test
                    touch newfile
                    git config --global user.email "vishal.baghla@gmail.com"
                    git config --global user.name "vishal"
                    git add . --all
                    git status
                    git commit -am "adding pom.xml"
                    git push https://${GIT_CREDENTIALS}@github.com/VishalBaghla/test.git
                '''
            }
        }
    }
    post {
        success {
          sh "echo Success."
        }
        failure {
          sh "echo Failure."
        }
        always {
            cleanWs()
        }
    }
}
