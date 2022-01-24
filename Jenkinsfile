pipeline {
    agent any

    stages {
        stage('Deploy for master') {
            when{
             branch 'subnet'   
            }
            steps {
                echo 'Building..'
                echo "Running ${env.BRANCH_NAME} on ${env.JENKINS_URL}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                echo " labels ${env.labels}"
                
            }
        }
        stage('postDeploy') {
            
            steps {
                echo 'Deploying....'
            }
        }
    }
}
