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
                    def k8sNamespaceMap = new JsonSlurper().parseText(env.K8S_NAMESPACE_MAPPING)
                    def domainMapping = new JsonSlurper().parseText(env.DOMAIN_MAPPING)
                    def selectedDomains = params.DOMAINS.split(',')

                    env.ENVIRONMENT = k8sNamespaceMap[params.K8S_NAMESPACE]

                    def generatedYmlFiles = [:]


                    for (DOMAIN in selectedDomains) {
                        if (domainMapping.containsKey(DOMAIN)) {
                            env.DOMAIN = DOMAIN
                            env.INGRESS_NAME = "akamai-${env.DOMAIN}"
                            env.SUBDOMAIN = domainMapping[DOMAIN].subdomain
                            env.FINAL_SUBDOMAIN = env.SUBDOMAIN.isEmpty() ? env.ENVIRONMENT : "${env.SUBDOMAIN}.${env.ENVIRONMENT}"
                            env.TLD = domainMapping[DOMAIN].tld
                            env.DOMAIN_NAME = domainMapping[DOMAIN].domain_name
                            env.FINAL_DOMAIN = env.DOMAIN_NAME.isEmpty() ? env.TLD : "${env.DOMAIN_NAME}.${env.TLD}"

                            echo "Ingress name: ${env.INGRESS_NAME}"
                            echo "URL: https://www.${env.FINAL_SUBDOMAIN}.${env.FINAL_DOMAIN}"

                            // Generate the YML content for this domain
                            def ymlContent = """
                            # Your YML content here, using environment variables like \${env.INGRESS_NAME}, \${env.K8S_NAMESPACE}, etc.
                            """

                            // Store the YML content in the generatedYmlFiles map
                            generatedYmlFiles[DOMAIN] = ymlContent

                        } else {
                            error("Domain '${DOMAIN}' is not defined in DOMAIN_MAPPING.")
                        }
                    }

                    env.GENERATED_YML_FILES = generatedYmlFiles
                }
            }
        }
        stage('Create Ingress') {
            steps {
                script {
                    def generatedYmlFiles = env.GENERATED_YML_FILES

                    // Iterate through the generated YML files and create Ingress for each one
                    for (def DOMAIN in generatedYmlFiles.keySet()) {
                        def ymlContent = generatedYmlFiles[DOMAIN]

                        // Create the YML file for this domain
                        def ymlFileName = "akamai_${DOMAIN}.yml"
                        writeFile file: ymlFileName, text: ymlContent

                        // Apply the YML file to create Ingress (you can use kubectl or other tools)
                        sh "kubectl apply -f ${ymlFileName} --dry-run=client"
                    }
                }
            }
        }
    }
}
