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
                            sh 'cat deployment-common.yaml'
                            sh 'kubectl apply -f deployment-common.yaml --dry-run=client -o yaml'
                            sh 'cat deployment-common.yaml'
                        }
                    }
                }
            }
        }
    }
}
