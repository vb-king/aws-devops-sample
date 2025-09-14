# aws-devops-sample


Minimal Node.js app and pipeline to demonstrate CI/CD with AWS ECR + EC2.


## What is included
- Simple Express app (`app.js`)
- Dockerfile
- GitHub Actions workflow to build and push container to ECR
- `deploy.sh` script to pull image on EC2 and run it


## How to use
1. Create an ECR repository named `my-app` in your AWS account.
2. Push this repo to GitHub.
3. In GitHub repository settings -> Secrets, add `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` (access key should have permissions for ECR push).
4. On first run, either create an ECR repo or modify the workflow to create it using AWS CLI.
5. After GitHub Actions succeeds, login to your EC2 instance and run:


```bash
./deploy.sh ap-south-1 <your-account-id> my-app latest# aws-devops-sample
