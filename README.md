# Terraform Technical Assessment – Exercise 1

## Overview

This repository contains my implementation of the Terraform infrastructure design requested as part of the Site Reliability Engineer (SRE) technical assessment.

The exercise involved provisioning a complete AWS environment to support a web application, including:
- VPC with public/private subnets
- EC2 instance
- RDS PostgreSQL database
- S3 bucket with IAM role access
- Lambda function and API Gateway integration
- Encryption and security groups
- Route 53 and domain integration

## ✅ Implemented Modules

| Component      | Status       | Notes |
|----------------|--------------|-------|
| VPC            | ✔️ Complete  | Public and private subnets with hardcoded AZs for validation |
| EC2            | ✔️ Complete  | Moved to public subnet for accessibility |
| RDS            | ✔️ Complete  | Encrypted PostgreSQL, private subnet, custom SG |
| S3 + IAM       | ✔️ Complete  | Encrypted bucket, IAM role attached to EC2 with s3:GetObject |
| Lambda + API GW| ✔️ Stubbed  | Basic proxy setup without deployment ZIP |
| Route 53       | ⚠️ Skipped   | Assumes pre-owned domain; placeholder only |
| Encryption     | ✔️ Included | RDS + S3 use AES256 or default encryption |
| IAM Profiles   | ✔️ Included | EC2 attached to instance profile with access scope |

---

## 🔍 Known Gaps & Assumptions

- **No Terraform apply was run** due to credential unavailability. All validation was done with `terraform validate` and `terraform plan -refresh=false`.
- **AMI ID is a placeholder** (`ami-12345678`) and should be replaced with a region-valid Linux AMI before deployment.
- **EC2 was moved to public subnet** to allow SSH/HTTP — in production, a bastion host or NAT gateway would be needed.
- **Route 53** is stubbed; assumes domain already exists.
- **Lambda ZIP** and handler were not created to stay within scope.
- **RDS-to-Lambda connection** was not implemented due to complexity of subnet and timeout configuration — documented for future.

---

## 📂 Project Structure

```
/
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

---

## 🛠️ Validation

To validate this project (no apply needed):

```bash
terraform init
terraform validate
terraform plan -refresh=false
```