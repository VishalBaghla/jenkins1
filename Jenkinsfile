pipeline {
    agent any
    stages {
        stage('Replace Values in deployment-common.yaml') {
            steps {
                script {
                    def domainNames = ['de','it','co.kr','fr','pt','co.uk','co.jp','com.tr','com.ru','com.br','com.cn','com.au','com','com']
                    def ingressNames = ['de','it','co.kr','fr','pt','co.uk','co.jp','com.tr','com.ru','com.br','com.cn','com.au','espanol','arabic']
                    def hostNames = ['aries','aries','aries','aries','aries','aries','aries','aries','aries','aries','espanol.aries','arabic.aries']
                    for (int i = 0; i < domainNames.size(); i++) {
                        def domainName = domainNames[i]
                        def hostName = hostNames[i]
                        def ingressName = ingressNames[i]
                        sh """
                            sed -i 's/DOMAIN_NAME/${domainName}/g' new.yml
                            sed -i 's/HOST_NAME/${hostName}/g' new.yml
                            sed -i 's/INGRESS_NAME/${ingressName}/g' new.yml
                        """
                        sh "cat new.yml"
                        sh "cat new.yml"
                    }
                }
            }
        }
    }
}
