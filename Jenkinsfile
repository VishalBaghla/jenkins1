pipeline {
    agent any

    environment {
        // Define three list variables
        list1 = ['item1', 'item2', 'item3']
        list2 = ['apple', 'banana', 'cherry']
        list3 = ['red', 'green', 'blue']
    }

    stages {
        stage('Print Values') {
            steps {
                script {
                    // Define the number of iterations based on the length of one of the lists
                    int numIterations = env.list1.size()

                    // Loop through the lists and print one value from each
                    for (int i = 0; i < numIterations; i++) {
                        def value1 = env.list1[i]
                        def value2 = env.list2[i]
                        def value3 = env.list3[i]

                        echo "Value from list1: ${value1}"
                        echo "Value from list2: ${value2}"
                        echo "Value from list3: ${value3}"
                    }
                }
            }
        }
    }
}
