pipeline {
    agent any
    options { buildDiscarder(logRotator(numToKeepStr: '20')) }
    parameters { choice(name: 'DEPLOY_STAGE', choices: ['init', 'validate', 'apply', 'destroy', 'plan'], description: 'select the action') }
    stages {
        stage('TF init') {
            when {
                expression { params.DEPLOY_STAGE == 'init' }
            }
            steps {
                sh 'terraform init'
            }
        }
    stage('TF validate') {
        when {
                expression { params.DEPLOY_STAGE == 'validate' }
            }
            steps {
                sh 'terraform validate'
            }
        }
    stage('TF plan') {
        when {
                expression { params.DEPLOY_STAGE == 'plan' }
            }
            steps {
              sh 'terraform plan'
              echo "plan sucess"
            }
        }
    stage('TF apply') {
         when {
                expression { params.DEPLOY_STAGE == 'apply' }
            }
            steps {
                sh 'terraform apply --auto-approve'
                echo  "terraform apply sucess"
            }
        }
    stage('TF destroy') {
        when {
                expression { params.DEPLOY_STAGE == 'destroy' }
            }
            steps {
                sh 'terraform destroy --auto-approve'
                echo "eks cluster has been deleted"
            }
        }
    }
}
