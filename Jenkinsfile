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
                        userRemoteConfigs: [[credentialsId: 'jenkins1', url: 'git@github.com:VishalBaghla/test.git']]
//                         extensions: [[$class: 'RelativeTargetDirectory', $class: 'LocalBranch', localBranch: "**", submoduleCfg: [], relativeTargetDir: 'deployment']]
                    ])
//                     checkout([
//                         $class: 'GitSCM',
//                         branches: [[name: '*/feature/*']],
//                         doGenerateSubmoduleConfigurations: false,
//                         extensions: [[$class: 'LocalBranch', localBranch: "**"]],
//                         submoduleCfg: [],
//                         userRemoteConfigs: [[credentialsId: '99f978af-XXXX-XXXX-8147-2cf8f69ef864', url: 'http://TFS_SERVER:8080/tfs/DefaultCollection/Product/_git/Project']]
//                     ])
                }
            }
        }
        stage('Create and Push test.sh') {
            steps {
                script {
                    // Commit and push the changes
                    sh """
                        ls -ltr
                        mkdir path_new
                        cp -rf path/test path_new/test
                        find path_new -type f -exec sed -i 's/file/new_file/g' {} \\;
                        git add path_new/ && git commit -m 'Test' && git push
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
