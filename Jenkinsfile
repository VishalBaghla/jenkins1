pipeline {
    agent any
    stages {
        stage('Clone and Update Repository') {
            steps {
                script {
                    // Clone the destination repository using the SSH key
                    checkout([$class: 'GitSCM',
                        branches: [[name: 'testbranch']], // You can change the branch as needed
//                         doGenerateSubmoduleConfigurations: false,
//                         extensions: [[$class: 'CloneOption', depth: 1, noTags: true, reference: '', shallow: true]],
                        extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'deployment']],
                        userRemoteConfigs: [[credentialsId: 'jenkins1', url: 'git@github.com:VishalBaghla/test.git']]
                    ])
                }
            }
        }
        stage('Create and Push test.sh') {
            steps {
                script {
                    // Commit and push the changes
                    sh "ls -ltr & chmod 755 gitsync.sh && ./gitsync.sh"
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
