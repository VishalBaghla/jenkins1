pipeline {
    agent any
    stages {
        stage("Checkout code") {
            steps {
                script {
                    checkout([
                      $class: 'GitSCM',
                      branches: [[ name: "main" ]],
                      doGenerateSubmoduleConfigurations: false,
                      userRemoteConfigs: [[credentialsId: 'jenkins1', url: "https://github.com/VishalBaghla/test.git"]],
                      extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'deployment']]
                    ])
//                     withCredentials([usernamePassword(credentialsId: 'jenkins1', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh "echo 'test'"
                   sh "chmod 755 gitsync.sh && ./gitsync.sh"
//                     }
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
    }
}
