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
                      userRemoteConfigs: [[credentialsId: 'jenkins1', url: "https://github.com/VishalBaghla/personal.git"]],
                      extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'deployment']]
                    ])
                    withCredentials([usernamePassword(credentialsId: 'GIT', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh "echo 'test'"
        //            sh "chmod 755 gitsync.sh && ./gitsync.sh"
                    }
                }
            }
        }
        stage('Detect File Types') {
            steps {
                script {
                    def fileList = sh(script: 'git ls-files', returnStdout: true).trim().split('\n')
                    echo "Detected files: ${fileList.join(', ')}"
                    def javaDetected = fileList.any { it.endsWith('.java') }
                    def pythonDetected = fileList.any { it.endsWith('.py') }
                    def dockerfileDetected = fileList.any { it.endsWith('Dockerfile') }

                    if (dockerfileDetected) {
                        echo "Dockerfiles detected"
                    }
                    else if (javaDetected) {
                        echo "Java files detected"
                    }
                    else if (pythonDetected) {
                        echo "Python files detected"
                    }
                    else {
                        echo "No approved programming language detected"
                    }
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
