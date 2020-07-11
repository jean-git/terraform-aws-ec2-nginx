# terraform AWS - EC2 with Nginx
Very simple example of how to deploy an ec2 instance with ubuntu and install nginx webserver on aws

# Before install
    1 - You need install terraform, please follow offical documentation: https://learn.hashicorp.com/terraform/getting-started/install.html

    2 - You need install "aws cli" and credentials configured in you enviremonts, please follow offial docuimentation: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

# Install

    1 - Clone this repository: 
    ```sh
    $ git clone https://github.com/richardhughes/amazon-nginx-terraform.git
    ```
    2 - Enter in directory project and init project: 
     ```sh
     $ cd amazon-nginx-terraform
     $ terraform init.
     ```

# Run the project

    1 - Check plan project:
    ```sh
    $ terrform plan
     ```

    2 - Do deploy project:
    ```sh
    $ terraform apply
    ```

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
    ```sh
    $ terraform destroy
    ```