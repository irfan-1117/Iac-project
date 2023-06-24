pipeline {
    agent any
    
    tools {
      terraform 'Terraform'
      }

    stages {
        stage('Clean workspace') {
            steps {
             cleanWs()
            }
        }
        stage('Terraform init') {
            steps { 
                script {
                sh '''
                   terraform init
                '''
                }
            }
        }
    }
}
