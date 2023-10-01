pipeline {
    agent any
//     environment {
//         GIT_CREDENTIALS = credentials('jenkins1')
//     }
    stages {
        stage('Create and Push test.sh') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'jenkins1', keyFileVariable: 'SSH_KEY']) {
                sh """
                    #!/bin/bash
                    set -x
                    ssh-agent bash -c 'ssh-add $SSH_KEY;
                    git checkout -b new
                    touch test1
                    git add test1
                    git commit -m "test"
                    git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com:VishalBaghla/test.git
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
