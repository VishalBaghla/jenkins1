pipeline {
    agent any

    stages {
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
}
