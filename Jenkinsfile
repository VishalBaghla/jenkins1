pipeline {
    agent any

    stages {
        stage('Detect File Types') {
            steps {
                script {
                    def fileList = sh(script: 'git ls-files', returnStdout: true).trim().split('\n')
                    echo "Detected files: ${fileList}"

                    boolean javaDetected = false
                    boolean pythonDetected = false
                    boolean dockerfileDetected = false

                    for (String filePath : fileList) {
                        if (filePath.endsWith('.java')) {
                            echo "Java file detected: ${filePath}"
                            javaDetected = true
                        }
                        if (filePath.endsWith('.py')) {
                            echo "Python file detected: ${filePath}"
                            pythonDetected = true
                        }
                        if (filePath.endsWith('Dockerfile')) {
                            echo "Dockerfile detected: ${filePath}"
                            dockerfileDetected = true
                        }
                    }

                    if (javaDetected) {
                        echo "Java detected"
                    }
                    if (pythonDetected) {
                        echo "Python detected"
                    }
                    if (dockerfileDetected) {
                        echo "Dockerfile detected"
                    }
                }
            }
        }
    }
}
