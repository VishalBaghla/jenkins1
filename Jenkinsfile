pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                script {
                    def domainNames = ['de', 'co.in', 'com']
                    def hostNames = ['aries', 'aries', 'phoenix']
                    for (int i = 0; i < DOMAIN_NAMES.size(); i++) {
                        def domainName = DOMAIN_NAMES[i]
                        def hostName = HOST_NAMES[i]

                        echo "Deploying domain: ${domainName}, host: ${hostName}"

                        // Replace values in new.yaml using sed
                        sh """
                            sed -i 's/DOMAIN_PLACEHOLDER/${domainName}/g' new.yaml
                            sed -i 's/HOST_PLACEHOLDER/${hostName}/g' new.yaml
                        """

                        // Deploy using kubectl
                        sh "cat new.yaml"
                    }
                }
            }
        }
    }
}
