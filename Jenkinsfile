pipeline {

    options {
        buildDiscarder(logRotator(numToKeepStr: '5' , artifactNumToKeepStr: '5'))
    }

    agent any 

    environment {
        AWS_ACCESS_KEY_ID    = credentials('terraform-aws')
        AWS_SECRET_ACCESS_KEY = credentials('terraform-aws')
        
    }

    stages {
        stage ('Terraform Version') {
            steps {
                echo 'Terraform Initialization is In Progress !'
                sh 'terraform --version'
            }
        }
        stage ('Terraform format') {
            steps {
                echo 'Terraform Initialization is In Progress !'
                sh 'terraform fmt'
            }
        }
        stage ('Terraform init') {
            steps {
                echo 'Terraform Initialization is In Progress !'
                sh 'terraform init'
            }
        }
        stage ('Terraform plan') {
            steps {
                echo 'Terraform Initialization is In Progress !'
                sh 'terraform plan -var-file=terraform.tfvars -out=tfplan.txt'
            }
        }
        stage ('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoapprove
                }
            }
            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                       parameters: [text(name: 'plan', description: 'please review the plan', defaultvalue: plan)]
                }
            }   
         }
         stage ('terraform apply') {
            steps {
                echo 'Terraform Apply'
                sh 'terraform apply --auto-approve'
            }
         }

        }
}

