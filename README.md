# terraform AWS - EC2 with Nginx
Very simple example of how to deploy an ec2 instance with ubuntu and install nginx webserver on aws

# Before install
    1 - You need install terraform, please follow official documentation: https://learn.hashicorp.com/terraform/getting-started/install.html

    2 - You need install "aws cli" and credentials configured in you enviremonts, please follow official documentation: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

    3 - You need have ec2-key-pair to have ssh access in webserver, please follow official documentation: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html

# Install

    1 - Clone this repository: 

    git clone https://github.com/jean-git/terraform-aws-ec2-nginx.git

    2 - Enter in directory project and init project: 
        cd amazon-nginx-terraform
        terraform init.

    3 - configure you key paier name in main.tf
        change variable value:   key_name = "YOUR KEY PAIR NAME"

# Run the project

    1 - Check plan project:
        terrform plan

    2 - Do deploy project:
        terraform apply

# Acces Nginx webserver
    After deploy, you recieve in your console something like that:

        public_dns = [
        "ec2-18-223-0-193.us-east-2.compute.amazonaws.com",
        ]
        public_ip = [
        "18.223.0.193",
        ]

    get your public_dns or public_ip and put on your webbrowser and view result:
                 Yes
        Deployed via Terraform

# Destroy the project
    terraform destroy