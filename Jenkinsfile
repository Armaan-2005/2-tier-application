pipeline{
    agent any
    stages{

        stage("Backend Initialization"){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_credentials']]) {
                dir("backend"){
                    bat 'terraform init -reconfigure'
                    bat 'terraform apply -auto-approve'
                        }
                    }
                }
            }

        stage("Terraform Initialization") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_credentials']]) {
                    bat 'terraform init -reconfigure'
                    bat 'terraform fmt'
                }
            }
        }

        stage("Terraform planning") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: 'AWS_credentials']]) {
                    bat 'terraform validate'
                    bat 'terraform plan -out=tfplan'
                }
            }
        }

        stage("Terraform execution") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: 'AWS_credentials']]) {
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage("Terraform state check") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: 'AWS_credentials']]) {
                    bat 'terraform state list'
                    bat 'terraform output'
                }
            }
        }
    }

    post {
        success {
            echo "======== TEST SUCCESSFULL ========"
        }
        failure {
            echo "======== EXECUTION FAILED ========"
        }
    }
}
