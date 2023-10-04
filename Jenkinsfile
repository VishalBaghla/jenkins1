properties([
    parameters([
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
                    'return ["K8S_DEV"]'
            ]
        ]],
        choice(name: 'K8S_SECURITY_ZONE', choices: 'RED\nBLACK', description: 'Security Zone'),
        [$class: 'ChoiceParameter',
            choiceType: 'PT_SINGLE_SELECT',
            description: 'Select a Project ',
            filterLength: 1,
            filterable: false,
            name: 'K8S_NAMESPACE',
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
                        'return ["ram-dev1","ram-test1","ram-dev2","ram-test2","ram-dev3","ram-test3","ram-dev4","ram-test4","ram-dev5","ram-test5","ram-dev6","ram-test6","ram-dev7","ram-test7","ram-dev8","ram-test8","ram-dev9","ram-test9","ram-dev10","ram-test10","ram-dev11","ram-test11","ram-dev12","ram-test12","ram-dev13","ram-test13","ram-dev14","ram-test14","ram-dev15","ram-test15","ram-dev16","ram-test16","ram-dev17","ram-test17","ram-dev18","ram-test18","ram-dev19","ram-test19","ram-dev20","ram-test20","ram-dev21","ram-test21","ram-dev22","ram-test22","ram-dev23","ram-test23","ram-dev24","ram-test24","ram-dev25","ram-test25","ram-dev26","ram-test26","ram-dev27","ram-test27","ram-dev31","ram-test31","ram-dev32","ram-test32","ram-dev33","ram-test33","dsp-int2","dsp-int3","dsp-int6","loyalty-dev1","loyalty-test1","loyalty-dev2","hws-dev3","hws-test3","ram-intdev2","swimu-dev1","swimu-test1","ram-intdev4","ram-dev35","ram-test35","ram-dev38","ram-test38","ram-dev39","ram-test39","ram-devtrunk1","ram-testtrunk1","phoenix-bookdev1","phoenix-test1","phoenix-dev1","phoenix-test1"]'
                ]
            ]
        ]
    ])
])

pipeline {
    agent any
//     agent {label 'slave'} {
//         docker {
//             image 'artifactory.marriott.com/base-images/aries-deployer:v2'
//             registryUrl 'https://artifactory.marriott.com/'
//             registryCredentialsId 'DTR'
//             label 'slave'
//         }
//     }
    options {
        timestamps()
    }

    environment {
        HOME="./"
        KUBECONFIG=".config"
        K8S_NAMESPACE = "${params.K8S_NAMESPACE}"
        K8S_SERVER = "${params.K8S_SERVER}"
        K8S_SECURITY_ZONE = "${params.K8S_SECURITY_ZONE}"
    }

    stages {
        stage("Deploy") {
            steps{
                ansiColor('xterm') {
                    script {
                        def domainNames = ['de','it','co.kr','fr','pt','co.uk','co.jp','com.tr','com.ru','com.br','com.cn','com.au','com','com']
                        def ingressNames = ['de','it','co.kr','fr','pt','co.uk','co.jp','com.tr','com.ru','com.br','com.cn','com.au','espanol','arabic']
                        def hostNames = ['aries','aries','aries','aries','aries','aries','aries','aries','aries','aries','espanol.aries','arabic.aries']
//                         servercreds ="ARIES_${params.K8S_SERVER}_${params.K8S_SECURITY_ZONE}_KUBECONFIG"
//                         withCredentials([file(credentialsId: servercreds, variable: 'kubeConfig')]) {
	                        for (int i = 0; i < domainNames.size(); i++) {
                                def domainName = domainNames[i]
                                def hostName = hostNames[i]
                                def ingressName = ingressNames[i]
                                sh """
                                    sed -i 's/DOMAIN_NAME/${domainName}/g; s/HOST_NAME/${hostName}/g; s/INGRESS_NAME/${ingressName}/g; s/K8S_NAMESPACE/${K8S_NAMESPACE}/g; s/K8S_SERVER/${K8S_SERVER}/g; s/K8S_SECURITY_ZONE/${K8S_SECURITY_ZONE}/g' locales.yml
                                """
//                                 withEnv(["DEPLOYMENT_NAME=${domainName}", "HOST_NAME=${hostName}", "DOMAIN_NAME=mydomain.com"]) {
//     		                        sh "cat locales.yml"
//                                     sh 'kubectl apply -f deployment-common.yaml --dry-run'

//                                 sh "chmod 755 $KUBECONFIG && kubectl config set-context --current --namespace=${env.K8S_NAMESPACE}"
//                                 if (params.DRY_RUN) {
//                                     env.DRYRUN='--dry-run'
//                                 } else {
//                                     env.DRYRUN=''
//                                 }
//                                 sh "cat locales.yml"
//                                 sh """
//                                     ./mi-tec --template locales.yml
//                                     cat locales.yml
//                                     kubectl apply -f locales.yml
//                                 """
                                }
			                }
// 			            }
                    }
               }
            }
        }
    } // end stages
    post {
        success {
            sh "echo Success."
        }
        failure {
            sh "echo Failure."
        }
    }
} // end pipeline