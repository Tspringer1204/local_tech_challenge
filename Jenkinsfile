pipeline {
    agent any
    environment {
        // Define environment variables
        AWS_DEFAULT_REGION = 'us-east-1' // AWS region you're working in
        AWS_ACCOUNT_ID = '590183717215' // Your AWS account ID
        ECR_REPOSITORY = 'my-application-repo' // ECR repository name
        FRONTEND_SERVICE_NAME = 'frontend-service' // Frontend ECS service name
        BACKEND_SERVICE_NAME = 'backend-service'  // Backend ECS service name
        ECS_CLUSTER_NAME = 'my-cluster' // ECS cluster name
    }
    stages {
        stage('Build Docker Images') {
            steps {
                script {
                    // Build Docker images for frontend and backend
                    sh 'docker build -t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY:frontend ./frontend'
                    sh 'docker build -t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY:backend ./backend'
                }
            }
        }
        stage('Push to ECR') {
            steps {
                script {
                    // Login to ECR
                    sh 'aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com'
                    // Push images to ECR
                    sh 'docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY:frontend'
                    sh 'docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ECR_REPOSITORY:backend'
                }
            }
        }
        stage('Update ECS Services') {
            steps {
                script {
                    // Force a new deployment of the ECS services
                    sh "aws ecs update-service --cluster $ECS_CLUSTER_NAME --service $FRONTEND_SERVICE_NAME --force-new-deployment"
                    sh "aws ecs update-service --cluster $ECS_CLUSTER_NAME --service $BACKEND_SERVICE_NAME --force-new-deployment"
                }
            }
        }
    }
}

