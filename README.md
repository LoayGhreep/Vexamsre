# Terraform Infrastructure – DevOps Technical Assessment

This repository contains a fully modular and validated Terraform infrastructure designed to meet the technical requirements outlined in the SRE assessment.

---

## 📦 Project Overview
<p align="center">
  <img src="https://raw.githubusercontent.com/LoayGhreep/Vexamsre/refs/heads/main/arch.svg" alt="AWS Architecture Diagram" width="100%"/>
  <br/>
</p>

This implementation sets up a complete AWS environment that includes:

- A custom VPC with both public and private subnets
- An EC2 instance with internet access and secure IAM integration
- A PostgreSQL RDS instance configured in two private subnets
- An encrypted S3 bucket accessible only via EC2 IAM role
- A stubbed Lambda function connected to API Gateway
- Security groups, encryption, subnet groups, and IAM roles
- Modular structure for easy reusability and extension

---

## ✅ Delivered Features

| Feature                            | Status        | Notes |
|------------------------------------|---------------|-------|
| VPC with public + private subnets  | ✅ Complete    | 1 public, 2 private subnets for RDS coverage |
| EC2 instance (public subnet)       | ✅ Complete    | Connected to IGW for HTTP/SSH testing |
| EC2 SG (22, 80 open)               | ✅ Complete    | Global access for quick access testing |
| S3 bucket (encrypted)              | ✅ Complete    | AES256 encryption + IAM-limited access |
| IAM: EC2 → S3 (read-only)          | ✅ Complete    | Attached via instance profile |
| RDS PostgreSQL (private)           | ✅ Complete    | v14.10, encrypted, private subnets |
| Lambda Function (stub)             | ✅ Complete    | Minimal Node.js function with zip hash |
| API Gateway → Lambda               | ✅ Complete    | Route `GET /` to Lambda |
| Terraform validate + apply         | ✅ Complete    | Fully tested on real AWS account |

---

## ⚠️ Not Implemented (Documented Trade-Offs)

- **EC2 in private subnet**: Moved to **public subnet** to allow testing without a NAT gateway or bastion host.
- **Route 53 / Custom domain**: Mocked. Domain assumed to exist but not provisioned in Terraform.
- **Lambda → RDS integration**: Deferred. Requires VPC Lambda setup, DB clients, and secret management.
- **Application logic**: Lambda is a stub/empty function with no business logic.

---

## 🧪 Testing Confirmation

The deployed infrastructure was tested live:

- EC2 was reachable via SSH and returned expected responses on port 80
- Lambda responded with HTTP 200 via API Gateway
- RDS provisioned successfully with working subnet group
- S3 access was validated via IAM permissions attached to EC2
- Terraform destroy completed with no dangling resources

---

## 🗂️ Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
└── modules/
    ├── vpc/
    ├── ec2/
    ├── rds/
    ├── s3_iam/
    └── lambda_apigw/
```