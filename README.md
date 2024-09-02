# NestJS MariaDB EKS Boilerplate

A boilerplate project for building scalable applications using NestJS with MariaDB, designed to run on AWS EKS.

## Features

- **NestJS**: A progressive Node.js framework for building efficient, reliable, and scalable server-side applications.
- **MariaDB**: An open-source relational database, providing a solid and reliable database solution.
- **AWS EKS**: Easily deploy and manage Kubernetes clusters using Amazon Elastic Kubernetes Service (EKS).
- **Docker**: Containerize the application for consistent and portable deployments.
- **Kubernetes**: Orchestrate your containerized applications using Kubernetes on AWS.

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Node.js (v14.x or later)
- Docker
- AWS CLI
- kubectl
- AWS IAM Authenticator for Kubernetes
- An existing EKS cluster and associated kubeconfig setup

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/nestjs-mariadb-eks-boilerplate.git
   cd nestjs-mariadb-eks-boilerplate
   ```

2. **Install dependencies:**

   ```bash
   yarn install
   ```

3. **Configure environment variables:**

   Create a .env file at the root of the project and configure the necessary environment variables:

   ```bash
   DATABASE_HOST=your-mariadb-host
   DATABASE_PORT=3306
   DATABASE_USER=your-username
   DATABASE_PASSWORD=your-password
   DATABASE_NAME=your-database
   ```

4. **Build and run the Docker container:**

   ```bash
   docker-compose up --build
   ```

### Deployment to EKS

1. **Build the Docker image:**

   ```bash
   docker build --platform linux/amd64 -t nestjs-mariadb-eks-boilerplate:latest .
   ```

2. **Tag Docker Image for AWS ECR**

   ```bash
   docker tag nestjs-mariadb-eks-boilerplate:latest <your-aws-account-id>.dkr.ecr.<region>.amazonaws.com/<repository-name>:latest
   ```

3. **Push the Docker image to a container registry (e.g., ECR, Docker Hub):**

   ```bash
   docker push <your-aws-account-id>.dkr.ecr.<region>.amazonaws.com/<repository-name>:latest
   ```

4. **Deploy to EKS using Kubernetes manifests:**

- Update the Kubernetes deployment YAML files in the k8s directory with your image name and other configurations.
- Apply the manifests:

   ```bash
   kubectl apply -f k8s/
   ```