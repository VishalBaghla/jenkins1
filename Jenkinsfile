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
                    pipelineLogger.info("Java detected ${fileList}")

                    if (fileList.contains(".java")) {
                        pipelineLogger.info("Java detected")
                    }
                    if (fileList.contains(".py")) {
                        pipelineLogger.info("Python detected")
                    }
                }
            }
        }
    }
}
