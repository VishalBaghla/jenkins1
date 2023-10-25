import groovy.json.JsonSlurper

properties([
     parameters([
        [$class: 'ChoiceParameter',
            choiceType: 'PT_SINGLE_SELECT',
            description: 'LOCALE_NAME',
            filterLength: 1,
            filterable: false,
            name: 'all_apps',
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
                        'return ["all"]'
                ]
            ]
        ],
        [$class: 'ChoiceParameter',
        choiceType: 'PT_CHECKBOX',
	    description: 'PREFIX',
        filterLength: 1,
        filterable: false,
        name: 'APPS',
        referencedParameters: 'all_apps',
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
                script: [
                    $class: 'GroovyScript',
                    script: """
//                         def url = "https://artifactory.xyz.com/artifactory/aad/active-choices/test.json"
                        def url = readFile('test.json')
                        import groovy.json.JsonSlurper
                        def json = url.toURL().getText(requestProperties: [Accept: 'application/json'])
                        def apps = new JsonSlurper().parseText(json)
                        def options = apps.keySet().collect { option ->
                            [name: option, value: option]
                        }
                        if (binding.variables['all_apps']) {
                            options.each { it.selected = true }
                        }
                        return options
                    """
                ]
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