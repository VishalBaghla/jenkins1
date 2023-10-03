pipeline {
    agent any
    
    environment {
        DEPLOYMENT_NAMES = 'de co.in com'
        HOST_NAMES = 'aries aries phoenix'
    }
    
    stages {
        stage('Deploy') {
            steps {
                script {
                    def deploymentNamesList = DEPLOYMENT_NAMES.split(' ')
                    def hostNamesList = HOST_NAMES.split(' ')
                    
                    for (int i = 0; i < deploymentNamesList.size(); i++) {
                        def deploymentName = deploymentNamesList[i]
                        def hostName = hostNamesList[i]
                        
                        echo "Deploying ${deploymentName} to ${hostName}"
                        
                        // Set environment variables for kubectl
                        withEnv(["DEPLOYMENT_NAME=${deploymentName}", "HOST_NAME=${hostName}"]) {
                            sh 'cat locales.yml'
                            sh 'kubectl apply -f locales.yml --dry-run=client -o yaml'
                            sh 'cat locales.yml'
                        }
                    }
                }
            }
        }
    }
}
