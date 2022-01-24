pipeline {
    agent any

    stages {
        stage('Deploy') {
            steps {
                echo 'Building..'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                
            }
        }
        stage('postDeploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
