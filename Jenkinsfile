pipeline {
    agent any

    environment {
        // Define a list of app details
        appDetails = [
            [appName: 'app1', imageName: 'my-app-1', tag: 'v1.0'],
            [appName: 'app2', imageName: 'my-app-2', tag: 'v2.0'],
            // Add more app details as needed
        ]
    }

    stages {
        stage('Generate and Apply Deployments') {
            steps {
                script {
                    // Loop through the app details
                    for (appDetail in env.appDetails) {
                        def appName = appDetail.appName
                        def imageName = appDetail.imageName
                        def tag = appDetail.tag

                        // Generate the Kubernetes Deployment YAML content for this app
                        def deploymentYAML = """
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${appName}-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: ${appName}
  template:
    metadata:
      labels:
        app: ${appName}
    spec:
      containers:
        - name: ${appName}-container
          image: ${imageName}:${tag}
"""

                        // Write the Deployment YAML to a file
                        def yamlFileName = "${appName}-deployment.yaml"
                        writeFile(file: yamlFileName, text: deploymentYAML)

                        // Apply the Deployment to Kubernetes
                        sh "kubectl apply -f ${yamlFileName}"
                    }
                }
            }
        }
    }
}
