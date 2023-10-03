pipeline {
  agent any

  environment {
    def myMap = [
      'key1': 'value1',
      'key2': 'value2',
      'key3': 'value3'
    ]
  }

  stages {
    stage('Example') {
      steps {
        // Print the value of the map variable
        echo env.MAP_KEY_1
        echo env.MAP_KEY_2
        echo env.MAP_KEY_3
      }
    }
  }
}