# MuchTodo Backend Infrastructure & Deployment 

This repository holds the Infrastructure as Code (IaC) blueprints and multi-stage container deployment profiles required to provision and run the secure, two-tier `MuchTodo` Golang API against a protected MongoDB storage cluster natively inside AWS.

## 🛠️ Prerequisites
- **Terraform** (v1.5.0+)
- **AWS CLI** configured with administrative credentials profile
- **Docker & Docker Compose** installed locally (for testing phases)
- **SSH Client** for secure remote administrative tunneling execution paths

## 📂 Repository File Layout Structure
```text
backend-deployment-assessment/
├── terraform/
│   ├── main.tf                 # Network, Security Groups, EC2, and ALB logic
│   ├── variables.tf            # Dynamic parameters declarations and types
│   ├── outputs.tf              # Dynamic state attributes exports definitions
│   ├── terraform.tfvars.example # Public variable blueprint template file
│   └── user_data/
│       ├── backend_setup.sh    # Automates microservices container dependencies
│       └── mongodb_setup.sh    # Automates cloud storage server installation scripts
├── Dockerfile                  # Lean multi-stage runtime build manifest
├── docker-compose.yml          # Persistent cluster orchestration topology map
├── .dockerignore               # Context filter exclusion rules definition
├── README.md                   # System operations documentation playbook
└── evidence/                   # Pipeline execution layout screenshots registry
```

## 🗺️ Execution Guide

### Phase 1: Infrastructure Provisioning (Terraform)
1. Initialize the workspace dependencies modules:
   ```bash
   cd terraform
   terraform init
   ```
2. Review the plan changes ledger configuration profile map:
   ```bash
   terraform plan -var="my_ip=YOUR_IP_HERE/128"
   ```
3. Deploy the network layout topology matrix up into the cloud:
   ```bash
   terraform apply -var="my_ip=YOUR_IP_HERE/128" -auto-approve
   ```

### Phase 2: Container Isolation & Subnet Deployment
1. Tunnel securely into the isolated private subnet via the edge gateway node proxy:
   ```bash
   ssh -i your-key.pem -o ProxyCommand="ssh -i your-key.pem -W %h:%p ec2-user@BASTION_PUBLIC_IP" ec2-user@BACKEND_PRIVATE_IP
   ```
2. Bootstrap file directory profiles workspace structural trees:
   ```bash
   mkdir -p ~/much-to-do && cd ~/much-to-do
   ```
3. Boot up the dynamic runtime environments layout metrics matrix using background orchestrations:
   ```bash
   docker-compose up -d --build
   ```
4. Verify execution metrics health:
   ```bash
   docker-compose ps
   ```

## 🏁 Teardown & Resource Cleanup Instructions
To securely decommission the active cluster architecture ledger mapping and avoid lingering cloud billing fees, run the unified teardown stack command from your local host machine terminal workspace root directory:
```bash
terraform destroy -var="my_ip=YOUR_IP_HERE/128" -auto-approve
```
