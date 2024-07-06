pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')  // Store AWS credentials in Jenkins
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    TERRAFORM_VERSION = '0.14.5'  // Update to your required Terraform version
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://your-repo-url.git'  // Replace with your repository URL
      }
    }

    stage('Install Terraform') {
      steps {
        sh '''
        if ! [ -x "$(command -v terraform)" ]; then
          curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
          unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
          sudo mv terraform /usr/local/bin/
          rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        fi
        '''
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Apply') {
      steps {
        sh 'terraform apply -auto-approve'
      }
    }
  }

