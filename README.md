# AWS Advanced Networking Infrastructure with Terraform

## Overview
This project demonstrates how to design and deploy an **enterprise-grade AWS networking architecture** using Terraform.  
It implements a **Hub-and-Spoke VPC topology** connected via a **Transit Gateway (TGW)**, secured with **CloudFront and AWS WAF**, and serves traffic through an **Application Load Balancer (ALB)**.

The goal is to showcase **real-world cloud networking patterns** that are used in multi-VPC, secure, and scalable AWS environments.

---

## 🏗 Architecture

### Components
- **Hub VPC**
  - Acts as the central router for all spoke VPCs.
  - Connected to a Transit Gateway.
- **Spoke VPCs**
  - `app-vpc`: Hosts the Application Load Balancer and app instances.
  - `db-vpc`: Reserved for backend/database resources.
- **Transit Gateway (TGW)**
  - Provides scalable VPC-to-VPC connectivity.
- **Application Load Balancer (ALB)**
  - Distributes traffic to app instances in `app-vpc`.
- **CloudFront Distribution**
  - Serves as a global CDN with DDoS protection.
  - Integrated with AWS WAF for Layer 7 security rules.
- **AWS WAF**
  - Protects applications against SQL injection, XSS, and bot attacks.

---

## 📂 Repository Structure
aws-advanced-networking-infra/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── modules/
│ ├── vpc/
│ ├── tgw/
│ ├── alb/
│ └── cloudfront/
└── README.md


---

## 🚀 Deployment

### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) v1.5+
- AWS CLI configured with appropriate credentials
- An AWS account with permissions for:
  - VPC, Transit Gateway
  - EC2, ALB
  - CloudFront, WAF

### Steps
```bash
# Clone repo
git clone https://github.com/moisegermain/aws-advanced-networking-infra.git
cd aws-advanced-networking-infra

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Deploy resources
terraform apply -auto-approve
```
## 📸 Diagram (to be added):

[Insert architecture diagram here showing Hub VPC, Spoke VPCs, TGW, ALB, CloudFront, WAF]

## 🎯 Skills Demonstrated

Infrastructure as Code (IaC): Built with Terraform modules for reusability and scalability.

Cloud Networking: Implemented hub-and-spoke VPC design with Transit Gateway.

Load Balancing & Security: Configured ALB, CloudFront, and WAF for secure, high-availability workloads.

Automation & Best Practices: Used Terraform state management, variables, and outputs for maintainability.

## Learning Outcomes

Designing hub-and-spoke VPC architectures

Implementing Transit Gateway routing

Deploying a global entry point with CloudFront

Securing workloads with AWS WAF

Writing clean, modular Terraform code
