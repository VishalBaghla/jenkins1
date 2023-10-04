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
                            sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'
                            sh 'chmod u+x ./kubectl'
                            sh 'ls -ltr'
                            sh './kubectl apply -f locales.yml --dry-run=client -o yaml'
                            sh 'cat locales.yml'
                        }
                    }
                }
            }
        }
    }
}
