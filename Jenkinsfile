pipeline {
    agent any

    environment {
        // Define three variables with multiple values
        var1 = 'value11,value12,value13'
        var2 = 'value21,value22,value23'
        var3 = 'value31,value32,value33'
    }

    stages {
        stage('Print Values') {
            steps {
                script {
                    // Split the variable values into lists
                    def var1List = env.var1.split(',')
                    def var2List = env.var2.split(',')
                    def var3List = env.var3.split(',')

                    // Print one value from each variable using a loop
                    for (int i = 0; i < var1List.size(); i++) {
                        echo "Value from var1: ${var1List[i]}"
                        echo "Value from var2: ${var2List[i]}"
                        echo "Value from var3: ${var3List[i]}"
                    }
                }
            }
        }
    }
}
