pipeline {
    agent any
    options { buildDiscarder(logRotator(numToKeepStr: '10')) }
    parameters { choice(name: 'DEPLOY_STAGE', choices: ['apply', 'destroy', 'plan'], description: 'select the action') }
    stages {
        stage('TF init') {
            steps {
                sh 'terraform init'
            }
        }
    stage('TF validate') {
            steps {
                sh 'terraform validate'
            }
        }
    stage('TF plan') {
            steps {
               // sh 'terraform plan'
            }
        }
    stage('TF apply') {
         when {
                expression { params.DEPLOY_STAGE == 'apply' }
            }
            steps {
                //sh 'terraform apply --auto-approve'
                echo  "in apply stage"
            }
        }
    stage('TF destroy') {
        when {
                expression { params.DEPLOY_STAGE == 'destroy' }
            }
            steps {
                //sh 'terraform destroy --auto-approve'
                echo "in destroy stage"
            }
        }
    }
}
