pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/VishalBaghla/test.git'
        TEMP_CREDENTIALS_ID = 'temp'
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Clone the Git repository
                    checkout([$class: 'GitSCM', branches: [[name: 'main']],
                              userRemoteConfigs: [[url: env.GIT_REPO_URL]]])
                }
            }
        }
        stage('Copy and Find/Replace') {
            steps {
                script {
                    sh "cp -r ENV NEW_ENV"
                    sh "find NEW_ENV -type f -exec sed -i 's/dev/prod/g' {} \\;"
                }
            }
        }
        stage('Commit and Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.TEMP_CREDENTIALS_ID,
                            usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                        sh """
                            git config user.email 'your@email.com'
                            git config user.name 'Your Name'
                            cd NEW_ENV
                            git add -A
                            git commit -m 'Replace dev with prod'
                            git push ${env.GIT_USERNAME}:${env.GIT_PASSWORD}@${env.GIT_REPO_URL} master
                        """
                    }
                }
            }
        }
    }
}
