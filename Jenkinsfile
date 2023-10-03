pipeline {
    environment {
        APP_NAMES = ['app1', 'app2', 'app3', 'app4', 'app5', 'app6', 'app7', 'app8', 'app9', 'app10']
        IMAGE_NAMES = ['image1', 'image2', 'image3', 'image4', 'image5', 'image6', 'image7', 'image8', 'image9', 'image10']
    }
    stages {
        stage('Deploy Applications') {
            steps {
                script {
                    for (int i = 0; i < APP_NAMES.size(); i++) {
                        def appName = APP_NAMES[i]
                        def imageName = IMAGE_NAMES[i]
                        deployApp(appName, imageName)
                    }
                }
            }
        }
    }
}

def deployApp(appName, imageName) {
    sh """
        cat common-deployment.yaml |
        sed 's/APP_NAME/${appName}/g' |
        sed 's/IMAGE_NAME/${imageName}/g' |
        kubectl apply -f -
    """
}
