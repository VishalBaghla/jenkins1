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
        DOMAINS = "${params.DOMAINS.join(',')}"
        K8S_NAMESPACE = "${params.K8S_NAMESPACE}"
        INGRESS_NAME = "eks-${params.DOMAINS.join('-')}"
        K8S_NAMESPACE_MAPPING = '{"ram-perf1": "dev1", "ram-e2e1": "dev2"}'
        DOMAIN_MAPPING = '''
        {
            "us": {
                "subdomain": "arabic",
                "domain_name": "reservations",
                "tld": "example.com"
            },
            "uk": {
                "subdomain": "",
                "domain_name": "",
                "tld": "example.com"
            }
        }
        '''
    }

    stages {
        stage('Set Environment Variables') {
            steps {
                script {
                    // Parse the JSON mappings
                    def k8sNamespaceMap = new JsonSlurper().parseText(env.K8S_NAMESPACE_MAPPING)
                    def domainMapping = new JsonSlurper().parseText(env.DOMAIN_MAPPING)

                    // Set environment variables based on user selections
                    env.ENVIRONMENT = k8sNamespaceMap[params.K8S_NAMESPACE]
                    env.SUBDOMAIN = domainMapping[params.DOMAINS].subdomain
                    env.DOMAIN_NAME = domainMapping[params.DOMAINS].domain_name
                    env.TLD = domainMapping[params.DOMAINS].tld
                }
            }
        }

        stage('Create Ingress') {
            steps {
                script {
                    // Replace "your-ingress.yaml" with the path to your Ingress YAML file
                    echo "Ingress name: ${env.INGRESS_NAME}"
                    echo "URL: https://www.${env.SUBDOMAIN}.${env.ENVIRONMENT}.${env.DOMAIN_NAME}.${env.TLD}"
                }
            }
        }
    }
}
