pipeline {
    agent any

    environment {
        appImageList = [
            [appName:app1, imageName: 'my-app1', tag: 'v1'],
            [appName:app2, imageName: 'my-app2', tag: 'v2']
            [appName:app3, imageName: 'my-app3', tag: 'v3']
        ]
    }

    stages {
        stage('Apply Kubernetes YAML') {
            steps {
                script {
                    // Read the Kubernetes YAML template from a file
                    def k8sTemplate = readFile('new.yaml')

                    // Iterate over the list and apply YAML for each app
                    for (entry in env.appImageList) {
                        def appName = entry.appName
                        def imageName = entry.imageName
                        def tag = entry.tag

                        // Replace placeholders in the YAML template with values
                        def updatedYaml = k8sTemplate.replaceAll('{{APP_NAME}}', appName)
                        updatedYaml = updatedYaml.replaceAll('{{IMAGE_NAME}}', "${imageName}:${tag}")

                        // Write the updated YAML to a temporary file
                        def tempFile = writeFile(file: "${appName}-deploy.yaml", text: updatedYaml)

                        // Apply the updated YAML to the Kubernetes cluster
                        // sh "kubectl apply -f ${tempFile}"
                    }
                }
            }
        }
    }
}
