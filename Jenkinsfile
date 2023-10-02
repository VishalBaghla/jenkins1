def documentationDir = 'deploy'

pipeline {
    agent any
    environment {
        GIT_CREDENTIALS = credentials('temp')
    }
    stages {
        stage('Create and Push test.sh') {
            steps {
//                 withCredentials([usernamePassword(credentialsId: 'temp', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
//                     sh "chmod 755 gitsync.sh && ./gitsync.sh"
//                 }
                withCredentials([usernamePassword(credentialsId: 'temp', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                sh '''
                    #!/bin/sh -e
                    cd $WORKSPACE
                    mkdir -p tmp
                    cd tmp
                    git clone -b main https://github.com/VishalBaghla/test.git
                    ls -ltr
                    cd test
                    touch newfile
                    git config --global user.email "vishal.baghla@gmail.com"
                    git config --global user.name "vishal"
                    git add . --all
                    git status
                    git commit -am "adding pom.xml"
                    git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/VishalBaghla/test.git
                '''
                }
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
