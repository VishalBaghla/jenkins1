pipeline {
    agent any
    stages {
        stage('Deploy Applications') {
            steps {
                script {
                    def domainNames = ['de', 'co.in', 'com']
                    def hostNames = ['aries', 'aries', 'phoenix']

                    for (int i = 0; i < domainNames.size(); i++) {
                        def domainName = domainNames[i]
                        def hostName = hostNames[i]

                        // Replace placeholders in the common deployment template
                        def deploymentYaml = readFile('new.yaml')
                        deploymentYaml = deploymentYaml.replace('<DOMAIN_NAME>', domainName)
                        deploymentYaml = deploymentYaml.replace('<HOST_NAME>', hostName)
                        deploymentYaml = deploymentYaml.replace('<VALUE_1>', 'value1') // Replace with actual values
                        deploymentYaml = deploymentYaml.replace('<VALUE_2>', 'value2') // Replace with actual values

                        // Deploy the application to Kubernetes
                        sh """
//                             echo "${deploymentYaml}"
                            echo "------------------------------"
                        """
                    }
                }
            }
        }
    }
}
