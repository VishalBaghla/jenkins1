pipeline {
    agent any

    environment {
        // Define a map variable with key-value pairs
        myMap = [app1: 'value1', app2: 'value2', app3: 'value3'].toString()

        // Define a list variable
        myList = ['item1', 'item2', 'item3'].toString()
    }

    stages {
        stage('Loop Over Map and List') {
            steps {
                script {
                    // Iterate over the list
                    for (listItem in env.myList) {
                        echo "Processing list item: $listItem"

                        // Iterate over the map
                        for (mapEntry in env.myMap) {
                            def appName = mapEntry.key
                            def appValue = mapEntry.value

                            // Execute a shell script with values from both map and list
                            sh "echo 'Processing $appName with value $appValue and list item $listItem'"
                            // Add more shell commands as needed
                        }
                    }
                }
            }
        }
    }
}
