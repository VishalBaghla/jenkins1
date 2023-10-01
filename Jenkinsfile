pipeline {
    agent any
    stages {
        stage("Checkout code") {
            steps {
                script {
                    checkout([
                      $class: 'GitSCM',
                      branches: [[ name: "main" ]],
                      userRemoteConfigs: [[credentialsId: 'jenkins1', url: "https://github.com/VishalBaghla/test.git"]],
                      extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'deployment']]
                    ])
                    // Create the test.sh file
                    writeFile file: 'test.sh', text: '#!/bin/bash\n\necho "Hello, world!"'
                    // Add, commit, and push the changes
                    sh 'git add gitsync.sh'
                    sh 'git commit -m "Add gitsync.sh"'
                    sh 'git push origin master'
//                    sh "chmod 755 gitsync.sh && ./gitsync.sh"
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
