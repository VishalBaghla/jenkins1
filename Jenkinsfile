def documentationDir = 'deploy'

pipeline {
    agent any
//     environment {
//         GIT_CREDENTIALS = credentials('jenkins1')
//     }
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
                    git clone -b main --single-branch https://github.com/VishalBaghla/test.git
                    cd test
                    cp -rf ENV PROD
                    git status
                    git add .
                    git commit -m "Performance Test Update"
                    git push https://${GIT_USERNAME}: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@github.com/VishalBaghla/test.git
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
