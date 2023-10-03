pipeline {
    agent any

    environment {
        // Define a map variable in the environment section
        myMap = [key1: 'value1', key2: 'value2', key3: 'value3']
    }

    stages {
        stage('Example Stage') {
            steps {
                script {
                    // You can access the map variable within a script block
                    echo "Value for key1: ${env.myMap.key1}"
                }
            }
        }
    }
}
