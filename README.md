# Complete-CICD-with-Terraform
Auto scalling with AWS EKS by using IaC Terraform with Jenkins for CICD
- First step adding Provisioning
## for jenkins shared library branch refer repo with same branch name
  https://github.com/HarshwardhanPatil07/jma-complete-cicd-jenkins-docker-aws 
![terraform-provisioning](/assets/terraform-provisioning.png)

# Steps to do
1. Create SSH Key-pair
2. Install TF inside jenkins container
3. TF configuration to provision server
4. Adjust Jenkinsfile

## 1. Configure credential in jenkins
- jenkins dashboard -> Manage Jenkins -> Global Credential -> Kind- ssh username and pri, cat .pem file to get content and paste in the private key area  -> Step one done

## 2. Install Tf inside jenkins container
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```