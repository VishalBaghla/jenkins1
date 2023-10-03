pipeline {
    agent any

    stages {
        stage('Replace Values in deployment-common.yaml') {
            steps {
                script {
                    def domainNames = ['de', 'co.in', 'com']
                    def hostNames = ['aries', 'aries', 'phoenix']

                    for (int i = 0; i < domainNames.size(); i++) {
                        def domainName = DOMAIN_NAMES[i]
                        def hostName = HOST_NAMES[i]
                        echo "Deploying domain: ${domainName}, host: ${hostName}"
                        sh """
                            sed -i 's/DOMAIN_PLACEHOLDER/${domainName}/g' new.yaml
                            sed -i 's/HOST_PLACEHOLDER/${hostName}/g' new.yaml
                        """
                    }
                        sh "cat new.yaml"
                }
            }
        }
    }
}
