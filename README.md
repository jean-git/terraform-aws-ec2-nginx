# terraform AWS - EC2 with Nginx
Very simple example of how to deploy an ec2 instance with ubuntu and install nginx webserver on aws

# Before install
    1 - You need install terraform, please follow offical documentation: https://learn.hashicorp.com/terraform/getting-started/install.html

    2 - You need install "aws cli" and credentials configured in you enviremonts, please follow offial docuimentation: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

# Install
    1 - Clone this repository: git clone https://github.com/richardhughes/amazon-nginx-terraform.git

    2 - Enter in directory project and init project: 
        cd amazon-nginx-terraform
        terraform init.

# Run the project

    1 - Check plan project:
        terrform plan

    2 - Do deploy project:
        terraform apply

# Destroy the project
    terraform destroy
