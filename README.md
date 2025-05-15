# Issues (To be updated)
- EC2 in private subnet but allow SSH & HTTP from outside (That's public not private)
- Route53 for custom domain => Assume any domain
- Lambda accessing RDS in private subnet => this one is complex
- The need for an actual test => setup my aws for testing later at the end

# Exercise 1:

## Structure

```
exercise-1/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
└── modules/
    ├── vpc/
    ├── ec2/
    └── ...
```

## Status

| Requirement                        | Status         | Notes                                                  |
|------------------------------------|----------------|--------------------------------------------------------|
| VPC (public/private subnets)       | ✔️ Done         | AZs hardcoded for validation                          |
| EC2 in private subnet              | ⚠️ Adjusted     | Moved to public subnet to avoid NAT/bastion issues    |
| RDS PostgreSQL                     | ▶️ Planned      | Module to be added                                    |
| EC2 SG (HTTP, SSH)                 | ✔️ Done         | Open to 0.0.0.0/0                                      |
| IAM role for EC2 → S3              | ▶️ Planned      | Will attach s3:GetObject                              |
| Route 53 domain                    | ⚠️ Stubbed      | Placeholder, domain not provisioned                   |
| RDS/S3 encryption                  | ▶️ Planned      | Will use AWS-managed keys                             |
| Lambda → RDS                       | ⚠️ Deferred     | Documented, not implemented due to time               |
| API Gateway → Lambda               | ⚠️ Deferred     | Stubbed only                                           |

## Assumptions

- Region: `us-east-1`
- AZs hardcoded for validate-only setup
- EC2 placed in public subnet for SSH accessibility
- Placeholder AMI: `ami-12345678`
- Route 53 domain assumed to be pre-registered
- No real credentials or secrets loaded
- Modules structured for future expansion

## Next

- Add RDS module (with private subnet group, encryption, SG) [✔️ Done]
- Add S3 + IAM (read-only access for EC2)
- Add Lambda + API Gateway (stub + VPC config)