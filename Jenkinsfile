pipeline {
    agent any

    stages {
        stage('Clone Source Repository') {
            steps {
                script {
                    // Clone the source repository to a workspace
                    checkout([$class: 'GitSCM',
                              credentialsId: 'jenkins1',
                              branches: [[name: 'main']],  // Replace with the branch you want to clone
                              userRemoteConfigs: [[url: 'https://github.com/VishalBaghla/test.git']]])
                }
            }
        }

        stage('Create test.sh File') {
            steps {
                // Create the test.sh file in the workspace
                sh 'echo "#!/bin/bash\n\necho \"This is a test script!\"" > test.sh'
            }
        }

        stage('Push Changes to Target Repository') {
            steps {
                script {
                    // Configure Git identity
                    withCredentials([usernamePassword(credentialsId: 'jenkins1', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                        // Set Git user and email
                        sh 'git config user.email "jenkins@example.com"'
                        sh 'git config user.name "Jenkins"'

                        // Add, commit, and push changes to the target repository
                        sh 'git add test.sh'
                        sh 'git commit -m "Add test.sh file via Jenkins"'
                        sh 'git push https://username:${GIT_PASSWORD}@github.com/VishalBaghla/test.git main'  // Replace with target repo URL
                    }
                }
            }
        }
    }
}
