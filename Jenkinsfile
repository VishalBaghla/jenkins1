pipeline {
    agent any

    environment {
        // Define a map variable with 5 sample key-value pairs
        myMap = '''[
            key1: 'value1',
            key2: 'value2',
            key3: 'value3',
            key4: 'value4',
            key5: 'value5'
        ]'''
    }

    stages {
        stage('Sample Stage') {
            steps {
                script {
                    // You can access and use the map variable within the script block
                    echo "Value for key1: ${env.myMap['key1']}"
                    echo "Value for key2: ${env.myMap['key2']}"
                    // Add more echo statements as needed for other keys
                }
            }
        }
    }
}
