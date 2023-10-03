pipeline {
    agent any
    stages {
        stage('Deploy Applications') {
            matrix {
                axes {
                    axis {
                        name: 'APP_NAME'
                        values: 'app1', 'app2', 'app3', 'app4', 'app5', 'app6', 'app7', 'app8', 'app9', 'app10'
                    }
                }
            }
            steps {
                script {
                    def appName = "${APP_NAME}"
                    def imageName = "${appName}-image:latest" // Adjust how you construct image names

                    deployToKubernetes(appName, imageName)
                }
            }
        }
    }
}
