pipeline {
    agent any
    environment {
        GIT_CREDENTIALS = credentials('jenkins1')
    }
    stages {
        stage('Create and Push test.sh') {
            steps {
//                 withCredentials([usernamePassword(credentialsId: 'jenkins1', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                sh """
                    #!/bin/bash
                    set -x
                    git checkout -b new
                    touch test
                    git add test
                    git commit -m "test"
                    git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com:VishalBaghla/test.git
                """
//                 }
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
