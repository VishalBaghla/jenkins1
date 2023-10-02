pipeline {
    agent any

    environment {
        myMap = [app1: 'value1', app2: 'value2', app3: 'value3']
        myList = ['item1', 'item2', 'item3']
    }

    stages {
        stage('Run Shell Script with Map and List') {
            steps {
                script {
                    for (item in env.myList) {
                        sh "echo 'Processing $item'"
                        def appValue = env.myMap[item]

                        if (appValue != null) {
                            sh "echo 'Using value from map: $appValue'"
                            // Add your shell script commands here using appValue
                        } else {
                            error "No value found in the map for $item"
                        }
                    }
                }
            }
        }
    }
}
