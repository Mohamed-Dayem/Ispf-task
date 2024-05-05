pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    sh """
                        docker login -u ${USERNAME} -p ${PASSWORD}
                        docker build -t  mahmeddayem/app:v${BUILD_NUMBER} .
                        docker push mahmeddayem/ispf_dev:v${BUILD_NUMBER}
                    """
                }
            }
        }
}