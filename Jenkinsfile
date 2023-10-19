import groovy.json.JsonSlurper

properties([
     parameters([
        [$class: 'ChoiceParameter',
            choiceType: 'PT_MULTI_SELECT',
            description: 'LOCALE_NAME',
            filterLength: 1,
            filterable: false,
            name: 'APP',
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
                        'return ["de","it","co.kr","fr","pt","co.uk","co.jp","com.tr","com.ru","com.br","com.cn","com.au","com"]'
                ]
            ]
        ],
        [$class: 'CascadeChoiceParameter',
        choiceType: 'PT_SINGLE_SELECT',
	    description: 'PREFIX',
        filterLength: 1,
        filterable: false,
        name: 'PREFIX',
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
                    'return ["aries","espanol.aries","arabic.aries"]'
            ]
        ]],
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
            ]
        ],
    ])
])

pipeline {
  agent any
  options {
    timestamps()
  }

  environment {
    HOME="./"
    KUBECONFIG=".config"
    APP="${params.APP}"
    K8S_SERVER = "${params.K8S_SERVER}"
  }

  stages {
    stage("Deploy") {
      steps {
        ansiColor('xterm') {
          script {
            try {
                def jsonFileContents = readFile('test.json')
                def jsonSlurper = new JsonSlurper().parseText(jsonFileContents)
                def port = jsonSlurper[K8S_SERVER]

                echo "${port}"
            } catch (Exception e) {
                error "Error reading or parsing the JSON file: test.json. Error: ${e.message}"
            }
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