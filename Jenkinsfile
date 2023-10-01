pipeline {
    agent any
    stages {
        stage('Clone and Update Repository') {
            steps {
                script {
                    // Clone the destination repository using the SSH key
                    checkout([
                        $class: 'GitSCM',
                        branches: [[ name: 'testbranch' ]],
                        doGenerateSubmoduleConfigurations: false,
                        userRemoteConfigs: [[credentialsId: 'jenkins1', url: 'git@github.com:VishalBaghla/test.git']],
                        extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'deployment']]
                    ])
                }
            }
        }
        stage('Create and Push test.sh') {
            steps {
                script {
                    // Commit and push the changes
                    sh '''
                    ls -ltr
                    ls -ltr deployment\
                    cd deployment
                    ls -ltr
                    '''
//                     sh 'ls -ltr  & cd deployment & ls -ltr & chmod 755 gitsync.sh && ./gitsync.sh'
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
