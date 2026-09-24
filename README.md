# AWS Web Application Deployment & CI/CD

## Project Overview

This project demonstrates the deployment and automation of a web application on AWS using Linux, Docker, Nginx and GitHub Actions.

The application is hosted on an AWS EC2 RHEL server. Docker is used to containerize the application, while Nginx acts as a reverse proxy. GitHub Actions automates deployment whenever changes are pushed to the main branch.

## Architecture

GitHub → GitHub Actions → AWS EC2 → Nginx → Docker → Web Application

AWS S3 is used for application backups, while CloudWatch is used for server monitoring.

## Technologies

* AWS EC2
* RHEL
* Docker
* Nginx
* Git
* GitHub
* GitHub Actions
* AWS S3
* AWS IAM
* Amazon CloudWatch
* Bash

## Key Features

* Linux server administration
* Docker-based application deployment
* Nginx reverse proxy configuration
* Git-based version control
* Automated CI/CD deployment
* AWS IAM role-based access
* S3 application backups
* CloudWatch monitoring
* Firewall and security-group configuration

## Deployment Flow

1. Developer pushes changes to GitHub.
2. GitHub Actions starts the deployment workflow.
3. GitHub Actions connects securely to the EC2 server using SSH.
4. The server pulls the latest source code.
5. Docker builds a new application image.
6. The previous container is replaced with the new version.
7. Nginx forwards HTTP requests to the Docker container.
8. The updated application becomes available through the EC2 public endpoint.

## Backup

A Bash script creates a compressed application backup and uploads it to an AWS S3 bucket using the EC2 IAM role.

## Monitoring

CloudWatch is used to monitor EC2 resources including CPU, memory and disk utilization.

## Security

* SSH restricted to the administrator's IP
* HTTP exposed through port 80
* Docker application port not publicly exposed
* AWS IAM role used for S3 access
* GitHub private deployment key stored as a repository secret
* Private keys excluded from Git using `.gitignore`
