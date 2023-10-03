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
                        def ingress = readFile('new.yaml')
                        ingress = ingress.replace('<DOMAIN_NAME>', domainName)
                        ingress = ingress.replace('<HOST_NAME>', hostName)

                        // Deploy the application to Kubernetes
                        sh """
                            echo "${ingress}"
                            echo "------------------------------"
                        """
                    }
                }
            }
        }
    }
}
