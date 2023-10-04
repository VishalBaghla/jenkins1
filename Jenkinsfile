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
                        
                        // Create a template YAML file with placeholders
                        def templateYAML = """
apiVersion: apps/v1
kind: Deployment
metadata:
  name: \${DEPLOYMENT_NAME}-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: \${DEPLOYMENT_NAME}
  template:
    metadata:
      labels:
        app: \${DEPLOYMENT_NAME}
    spec:
      containers:
      - name: \${DEPLOYMENT_NAME}-container
        image: your-image:\${HOST_NAME}
        ports:
        - containerPort: 80
"""

                        // Substitute environment variables in the template YAML
                        def substitutedYAML = templateYAML.replaceAll('\\${DEPLOYMENT_NAME}', deploymentName).replaceAll('\\${HOST_NAME}', hostName)

                        // Write the substituted YAML to a file
                        writeFile(file: "deploy-${deploymentName}.yaml", text: substitutedYAML)

                        // Apply the substituted YAML using kubectl
                        sh "kubectl apply -f deploy-${deploymentName}.yaml"
                    }
                }
            }
        }
    }
}
