# Terraform AWS Example

This project demonstrates how to use Terraform to provision AWS infrastructure, including a VPC, security group, and an EC2 instance with an automatically generated SSH key pair.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.9.2 or higher installed on your local machine. 
- [AWS account](https://aws.amazon.com/free) and [associated credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) that allow you to create resources
- AWS CLI configured with your credentials

To use your IAM credentials to authenticate the Terraform AWS provider, set the `AWS_ACCESS_KEY_ID` environment variable:

```sh
export AWS_ACCESS_KEY_ID=your_access_key_id
export AWS_SECRET_ACCESS_KEY=your_secret_access_key
```

Replace `your_access_key_id` and `your_secret_access_key` with your actual AWS credentials.

## Project Structure

- `main.tf`: Contains the main Terraform configuration for provisioning AWS resources.
- `variables.tf`: Defines the variables used in the Terraform configuration.
- `outputs.tf`: Defines the outputs of the Terraform configuration.
- `generate_ssh_key.sh`: Shell script to generate an SSH key pair.
- `README.md`: This file.

## Usage

### Step 1: Configure Variables

Update the `variables.tf` file with your desired values. Ensure the `email` variable is set to your email address.

### Step 2: Initialize Terraform

Initialize the Terraform configuration:

```sh
terraform init
```

### Step 3: Apply Terraform Configuration

Apply the Terraform configuration to provision the resources:

```sh
terraform apply
```

### Step 4: Retrieve Outputs

After applying the configuration, Terraform will output the necessary information, including the SSH command to connect to the EC2 instance.

### Step 5: SSH into the EC2 Instance

Use the provided SSH command to connect to the EC2 instance. The command will look something like this:

```sh
ssh -i ~/.ssh/tf_user ubuntu@<EC2_PUBLIC_IP>
```

Replace `<EC2_PUBLIC_IP>` with the actual public IP address of the EC2 instance.

### Step 6: Destroy Resources

When you no longer need the resources, you can destroy them using the following command:

```sh
terraform destroy
```

This will remove all the resources created by the Terraform configuration, including the SSH key pair.

## License

This project is licensed under the MIT License.