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
            description: 'K8S Server',
            filterLength: 1,
            filterable: false,
            name: 'K8S_SERVER',
            script: [
                $class: 'GroovyScript',
                fallbackScript: [
                    classpath: [],
                    sandbox: false,
                    script:
                        'return [\'Error\']'
                ],
                script: [
                    classpath: [],
                    sandbox: true,
                    script:
                        'return ["K8S_PERF"]'
                ]
            ]
        ],
        choice(name: 'K8S_SECURITY_ZONE', choices: 'RED\nBLACK', description: 'Security Zone'),
    	choice(name: 'DEPLOYMENT_MODE', choices: 'green\nblue', description: 'deployment mode'),
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
        HOME="./"
        KUBECONFIG=".config"
        K8S_NAMESPACE = "${params.K8S_NAMESPACE}"
        DEPLOYMENT_MODE = "${params.DEPLOYMENT_MODE}"
        K8S_NAMESPACE_MAPPING = '{"ram-perf1": "dev1", "ram-e2e1": "dev2"}'
        DOMAIN_MAPPING = '''
        {
            "us": {
                "subdomain": "arabic",
                "domain_name": "abc",
                "tld": "xyz.com"
            },
            "uk": {
                "subdomain": "",
                "domain_name": "",
                "tld": "xyz.com"
            }
        }
        '''
    }

    stages {
        stage('Set Environment Variables and Create Ingress') {
            steps {
                script {
//                     servercreds ="ARIES_${params.K8S_SERVER}_${params.K8S_SECURITY_ZONE}_KUBECONFIG"
//                     withCredentials([file(credentialsId: servercreds, variable: 'kubeConfig')]) {
                        // Parse the JSON mappings
                        def k8sNamespaceMap = new JsonSlurper().parseText(env.K8S_NAMESPACE_MAPPING)
                        def domainMapping = new JsonSlurper().parseText(env.DOMAIN_MAPPING)
                        def selectedDomains = params.DOMAINS.split(',')

                        env.ENVIRONMENT = k8sNamespaceMap[params.K8S_NAMESPACE]

                        for (DOMAIN in selectedDomains) {
                            if (domainMapping.containsKey(DOMAIN)) {
                                env.DOMAIN = DOMAIN
                                env.INGRESS_NAME = "akamai-${env.DOMAIN}"
                                env.SUBDOMAIN = domainMapping[DOMAIN].subdomain
                                env.FINAL_SUBDOMAIN = env.SUBDOMAIN.isEmpty() ? env.ENVIRONMENT : "${env.SUBDOMAIN}.${env.ENVIRONMENT}"
                                env.TLD = domainMapping[DOMAIN].tld
                                env.DOMAIN_NAME = domainMapping[DOMAIN].domain_name
                                env.FINAL_DOMAIN = env.DOMAIN_NAME.isEmpty() ? env.TLD : "${env.DOMAIN_NAME}.${env.TLD}"

                                // Create the Ingress for the current domain
                                echo "Ingress name: ${env.INGRESS_NAME}"
                                echo "URL: https://www.${env.FINAL_SUBDOMAIN}.${env.FINAL_DOMAIN}"
                                sh """
                                cat locales.yml |
                                sed -e 's/INGRESS_NAME/${env.INGRESS_NAME}/g' \
                                    -e 's/K8S_NAMESPACE/${env.K8S_NAMESPACE}/g' \
                                    -e 's/FINAL_SUBDOMAIN/${env.FINAL_SUBDOMAIN}/g' \
                                    -e 's/FINAL_DOMAIN/${env.FINAL_DOMAIN}/g' \
                                    -e 's/DEPLOYMENT_MODE/${env.DEPLOYMENT_MODE}/g' \
                                > akamai_updated.yml
                                cat akamai_updated.yml
                                """
                            } else {
                                error("Domain '${DOMAIN}' is not defined in DOMAIN_MAPPING.")
                            }
//                         }
                    }
                }
            }
        }
    }
}
