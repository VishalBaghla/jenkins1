pipeline {
    agent any
    stages {
        stage('Deploy Applications') {
            steps {
                script {
                    def appNames = ['app1', 'app2', 'app3', 'app4', 'app5', 'app6', 'app7', 'app8', 'app9', 'app10']
                    def imageNames = ['image1:v1', 'image2:v1', 'image3:v1', 'image4:v1', 'image5:v1', 'image6:v1', 'image7:v1', 'image8:v1', 'image9:v1', 'image10:v1']

                    for (int i = 0; i < appNames.size(); i++) {
                        def appName = appNames[i]
                        def imageName = imageNames[i]

                        // Replace placeholders in the common deployment template
                        def deploymentYaml = readFile('new.yaml')
                        deploymentYaml = deploymentYaml.replace('<APP_NAME>', appName)
                        deploymentYaml = deploymentYaml.replace('<IMAGE_NAME>', imageName)
                        deploymentYaml = deploymentYaml.replace('<VALUE_1>', 'value1') // Replace with actual values
                        deploymentYaml = deploymentYaml.replace('<VALUE_2>', 'value2') // Replace with actual values

                        // Deploy the application to Kubernetes
                        sh """
                            echo "${deploymentYaml}"
                        """
                    }
                }
            }
        }
    }
}
