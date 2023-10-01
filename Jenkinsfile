pipeline {
    agent any
//     environment {
//         GIT_CREDENTIALS = credentials('jenkins1')
//     }
    stages {
        stage('Create and Push test.sh') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'temp', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                sh """
                    #!/bin/bash
                    set -x
                    git checkout main
                    touch test1
                    git add test1
                    git commit -m "test"
                    git push
                    git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/VishalBaghla/test.git new -v
                """
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
