pipeline {
    agent any
    stages {
        stage('Clone and Update Repository') {
            steps {
                script {
                    // Clone the destination repository using the SSH key
                    checkout([$class: 'GitSCM',
                        branches: [[name: 'master']], // You can change the branch as needed
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [[$class: 'CloneOption', depth: 1, noTags: true, reference: '', shallow: true]],
                        userRemoteConfigs: [[credentialsId: 'jenkins1', url: 'git@github.com:VishalBaghla/test.git']]
                    ])
                }
            }
        }
        stage('Create and Push test.sh') {
            steps {
                script {
                    def testShContent = '''#!/bin/bash
                    echo "This is a test script"
                    '''

                    // Create the test.sh file
                    writeFile file: 'test.sh', text: testShContent

                    // Commit and push the changes
                    sh 'git add .'
                    sh 'git commit -m "Add test.sh"'
                    sh 'git push origin master' // You can change the branch as needed
                }
            }
        }
    }
}
