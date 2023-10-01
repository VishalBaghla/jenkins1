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
                    dir('NEW_ENV') { // Change working directory to NEW_ENV
//                         sh "find . -type f -exec sed -i 's/dev/prod/g' {} \;"
                        sh "echo 'test'"
                    }
                }
            }
        }
        stage('Commit and Push') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.TEMP_CREDENTIALS_ID,
                            usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                        sh """
                            git status
                            git add .
                            git commit -m 'Replace dev with prod'
                            git push ${env.GIT_USERNAME}:${env.GIT_PASSWORD}@${env.GIT_REPO_URL} HEAD:main
                        """
                    }
                }
            }
        }
    }
}
