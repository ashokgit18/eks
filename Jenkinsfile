pipeline {
    agent any
    options { buildDiscarder(logRotator(numToKeepStr: '20')) }
    parameters { choice(name: 'DEPLOY_STAGE', choices: ['init', 'validate', 'apply', 'destroy', 'plan'], description: 'select the action') }
    stages {
        stage('AWS Credentials') {
           
            steps {
                sh 'aws configure'
                sh ''' export AWS_ACCESS_KEY_ID=AKIAZI2LCXLYDKKWCV5A
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=us-west-2 '''
            }
        }
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
