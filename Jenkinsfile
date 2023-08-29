pipeline {
    agent any

    stages {
        stage('Detect File Types') {
            steps {
                script {
                    // Clone the repository
//                     checkout scm

                    // Run git ls-files command to get a list of tracked files
                    def fileList = sh(script: 'git ls-files', returnStdout: true).trim().split('\n')
                    echo "Java detected ${fileList}"
                    for (String filePath : fileList) {
                        if (filePath.endsWith('.java')) {
                            pipelineLogger.info("Java detected path")
                            javaDetected = true
                        }
                        if (filePath.endsWith('.py')) {
                            pythonDetected = true
                        }
                    }
                    if (javaDetected) {
                        pipelineLogger.info("Java detected")
                    }
                    if (pythonDetected) {
                        pipelineLogger.info("Python detected")
                    }
                }
            }
        }
    }
}
