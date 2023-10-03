pipeline {
    agent any
    stages {
        stage('Replace Values in deployment-common.yaml') {
            steps {
                script {
                    def domainNames = ['de', 'co.in', 'com']
                    def hostNames = ['aries', 'aries', 'phoenix']

                    for (int i = 0; i < domainNames.size(); i++) {
                        def domainName = domainNames[i]
                        def hostName = hostNames[i]
                        echo "Deploying domain: ${domainName}, host: ${hostName}"
                        sh """
                            cat new.yml
                            #sed -i 's/DOMAIN_NAMES/${domainName}/g' new.yml
                            #sed -i 's/DOMAIN_NAMES/${hostName}/g' new.yml
                        """
                    }
                    sh "cat new.yml"
                }
            }
        }
    }
}
