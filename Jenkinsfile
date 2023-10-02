pipeline {
    agent any
    environment {
        MYLIST=['item1', 'item2', 'item3']
        MYMAP = [key1: 'value1', key2: 'value2', key3: 'value3']
    }

    stages {
        stage('Run Shell Script with Map and List') {
            steps {
                script {
                    for (item in env.MYLIST) {
                        sh "echo 'Processing $item'"
                        def appValue = env.MYMAP[item]

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
