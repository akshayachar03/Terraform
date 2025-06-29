---

```markdown
# 🚀 Terraform Flask App Deployment on AWS EC2

This project demonstrates how to deploy a simple **Python Flask application** on an **AWS EC2 Ubuntu instance** using **Terraform**. It uses `file` and `remote-exec` provisioners to automatically upload the app and start it.

---

## 📸 Live Preview

> _"Hello, This is my first Terraform project deployed into an EC2 instance."_  
> Includes a GitHub button, colorful background, and responsive layout.

---

## 📁 Project Structure

```

AppDeployterraform/
├── app.py                  # Flask application
├── templates/
│   └── index.html          # HTML frontend with styling
├── main.tf                 # Terraform config for EC2, SG, provisioners
├── outputs.tf              # Outputs the public IP
└── README.md               # This file

````

---

## ⚙️ Technologies Used

- **Terraform** for infrastructure as code
- **AWS EC2 (Ubuntu 22.04)** for hosting
- **Flask (Python)** for the web application
- **Bootstrap 5** for styling

---

## 📝 Prerequisites

- ✅ AWS account and IAM user with EC2 permissions
- ✅ Terraform installed on your system
- ✅ SSH key pair (generated via `ssh-keygen`)
- ✅ Flask app tested locally

---

## 🚀 Deployment Steps

### 1. Clone this repo

```bash
git clone https://github.com/akshayachar03/terraform-demo.git
cd AppDeployTerraform
````

### 2. Generate SSH Key Pair (if not already)

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
```

> On Windows: `C:/Users/<YourUsername>/.ssh/id_rsa`

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Apply Infrastructure

```bash
terraform apply
```

* This will:

  * Create an EC2 instance
  * Add security group for HTTP and SSH
  * Upload the app files using `file` provisioner
  * Install Flask and run the app using `remote-exec`

### 5. Access the App

After apply is complete, Terraform will output the public IP:

```
Outputs:
flask_app_ip = "XX.XX.XX.XX"
```

ssh to EC2 instance and run:

```http
python app.py
```
Open in your browser:

```http
http://XX.XX.XX.XX
```
---

## 🧹 Cleanup

To destroy all AWS resources created by this project:

```bash
terraform destroy
```

---



## 📎 Demo Screenshot

![ss1](https://github.com/user-attachments/assets/0657735c-0a38-4e51-b0f1-4aaa6c3ecddf)


---

## 🤝 Connect

If you found this useful or want to collaborate, feel free to reach out!

🔗 [LinkedIn](https://www.linkedin.com/in/akshayachar)
💻 [GitHub](https://github.com/akshayachar03)

---

## 🏷️ Tags

`#Terraform` `#AWS` `#EC2` `#Flask` `#Python` `#IaC` `#DevOps` `#CloudDeployment`

```

---


```

