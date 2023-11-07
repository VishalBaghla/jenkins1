import groovy.json.JsonSlurper

properties([
    parameters([
        [$class: 'ChoiceParameter',
            choiceType: 'PT_CHECKBOX',
            description: 'K8S Server',
            filterLength: 1,
            filterable: false,
            name: 'DOMAINS',
            script: [
                $class: 'GroovyScript',
                fallbackScript: [
                    classpath: [],
                    sandbox: false,
                    script: 'return ["Error"]'
                ],
                script: [
                    classpath: [],
                    sandbox: true,
                    script: 'return ["us", "uk"]'
                ]
            ]
        ],
        [$class: 'ChoiceParameter',
            choiceType: 'PT_SINGLE_SELECT',
            description: 'Select a NAMESPACE',
            filterLength: 1,
            filterable: false,
            name: 'K8S_NAMESPACE',
            script: [
                $class: 'GroovyScript',
                fallbackScript: [
                    classpath: [],
                    sandbox: false,
                    script: 'return ["Error"]'
                ],
                script: [
                    classpath: [],
                    sandbox: true,
                    script: 'return ["ram-perf1", "ram-e2e1"]'
                ]
            ]
        ]
    ])
])

pipeline {
    agent any

    environment {
        K8S_NAMESPACE_MAPPING = '{"ram-perf1": "dev1", "ram-e2e1": "dev2"}'
        DOMAIN_MAPPING = '''
        {
            "us": {
                "subdomain": "arabic",
                "domain_name": "reservations",
                "tld": "example.com"
            },
            "uk": {
                "subdomain": "arabic",
                "domain_name": "new",
                "tld": "example.com"
            }
        }
        '''
    }

    stages {
        stage('Set Environment Variables and Create Ingress') {
            steps {
                script {
                    // Parse the JSON mappings
                    def k8sNamespaceMap = new JsonSlurper().parseText(env.K8S_NAMESPACE_MAPPING)
                    def domainMapping = new JsonSlurper().parseText(env.DOMAIN_MAPPING)

                    // Iterate through selected domains
                    for (DOMAIN in params.DOMAINS) {
                        env.DOMAIN = DOMAIN
                        env.ENVIRONMENT = k8sNamespaceMap[params.K8S_NAMESPACE]
                        env.SUBDOMAIN = domainMapping[DOMAIN].subdomain
                        env.DOMAIN_NAME = domainMapping[DOMAIN].domain_name
                        env.TLD = domainMapping[DOMAIN].tld
                        env.INGRESS_NAME = "eks-${env.DOMAIN}"

                        // Create the Ingress for the current domain
                        echo "Creating Ingress for domain: ${env.DOMAIN}"
                        echo "Ingress name: ${env.INGRESS_NAME}"
                        echo "URL: https://www.${env.SUBDOMAIN}.${env.ENVIRONMENT}.${env.DOMAIN_NAME}.${env.TLD}"

                        // Replace this with actual Ingress creation using kubectl or any other method
                    }
                }
            }
        }
    }
}
