# Terraform AWS Multi-Environment Project 🌍
<img width="813" height="456" alt="Screenshot 2026-04-26 125535" src="https://github.com/user-attachments/assets/8e1ed56e-8d5e-491f-ac5d-a134aeb0f439" />

Provision AWS infrastructure across **Dev, Staging, and Production** using **Terraform modules + workspaces**.

This project showcases a clean, scalable Infrastructure as Code (IaC) approach with reusable modules and environment isolation.

---

## 🏗️ Architecture Overview

Each environment provisions a different scale of infrastructure:

| Environment | EC2 | DynamoDB | S3 |
| ----------- | --- | -------- | -- |
| Dev         | 2   | 1        | 1  |
| Staging     | 3   | 1        | 1  |
| Production  | 4   | 2        | 2  |

---

## 🧭 Architecture Flow

```
                  Terraform (Root Module)
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
      Dev               Staging           Production
        │                  │                  │
   ┌────┼────┐       ┌────┼────┐       ┌────┼────┐
   │    │    │       │    │    │       │    │    │
 EC2  S3  Dynamo   EC2  S3  Dynamo   EC2  S3  Dynamo
```

Each environment:

* Uses the same modules
* Has different configurations via `.tfvars`
* Is isolated using Terraform workspaces

---

## 📁 Project Structure

```bash
Terraform/Project_terraform-aws-multi-env/
│
├── modules/
│   ├── ec2/
│   ├── s3/
│   └── dynamodb/
│
├── env/
│   ├── dev.tfvars
│   ├── staging.tfvars
│   └── prod.tfvars
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
```

---

## ⚙️ Example Configuration (.tfvars)

### 🔹 dev.tfvars

```hcl
instance_count = 2
instance_type  = "t2.micro"

s3_bucket_count = 1

dynamodb_table_count = 1
```

---

### 🔹 staging.tfvars

```hcl
instance_count = 3
instance_type  = "t2.micro"

s3_bucket_count = 1

dynamodb_table_count = 1
```

---

### 🔹 prod.tfvars

```hcl
instance_count = 4
instance_type  = "t2.medium"

s3_bucket_count = 2

dynamodb_table_count = 2
```

---

## 🚀 Getting Started

### 1. Initialize

```bash
terraform init
```

---

### 2. Create Workspaces

```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```

---

### 3. Deploy Dev

```bash
terraform workspace select dev
terraform apply -var-file=env/dev.tfvars
```

---

### 4. Deploy Staging

```bash
terraform workspace select staging
terraform apply -var-file=env/staging.tfvars
```

---

### 5. Deploy Production

```bash
terraform workspace select prod
terraform apply -var-file=env/prod.tfvars
```

---

## 📦 Modules

### EC2 Module

* Configurable instance count
* Instance type controlled via variables

### S3 Module

* Creates one or more buckets
* Environment-based scaling

### DynamoDB Module

* Creates tables dynamically
* Count controlled via variables

---

## 🔐 State Management (Recommended Upgrade)

For real-world usage:

```hcl
backend "s3" {
  bucket         = "terraform-state-bucket"
  key            = "multi-env/terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "terraform-locks"
}
```

---

## 🧠 Key Learnings

* How to structure Terraform for multiple environments
* Using **workspaces vs separate folders**
* Writing reusable modules
* Managing environment-specific configurations

---

## 🛠️ Future Enhancements

* Add VPC module (network isolation)
* Add ALB + Auto Scaling
* Add RDS module
* Integrate CI/CD (GitHub Actions)
* Use Terraform Cloud or remote backend

---

## 👨‍💻 Author

Rohit Trivedi

---

## ⭐ Support

If this helped you, give it a ⭐ on GitHub!
