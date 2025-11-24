# Jikkosoft - Infraestructura Cloud & DevOps

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Infrastructure-Terraform-purple)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-green)
![Node.js](https://img.shields.io/badge/Runtime-Node.js-brightgreen)



##  Objetivos del proyecto

- Provisionar infraestructura básica en AWS (EC2, S3, VPC predeterminada, roles IAM).

- Desplegar una aplicación Node.js (Express) mediante Docker en EC2.

- Automatizar la instalación y despliegue con user_data y Terraform.

- Configurar un pipeline de CI/CD en GitHub Actions para pruebas y despliegue.

- Habilitar logging hacia CloudWatch y mostrar cómo visualizar métricas básicas.

# 📂 Estructura del proyecto:

```text
.
├── .gitignore
├── Dockerfile
├── health-check.sh
├── package-lock.json
├── package.json
├── server.js
├── test-app.js
│
├── .github/
│   └── workflows/
│       ├── ci-cd.yml
│       └── deploy-cv.yml
│
├── logs/
│
├── public/
│   ├── index.html
│   ├── script.js
│   ├── styles.css
│   └── img/
│       └── profile.jpg
│
└── terraform/
    ├── .terraform.lock.hcl
    ├── jikkosoft-ec2-key.pem
    ├── main.tf
    ├── outputs.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── user_data.sh
    ├── variables.tf
    │
    └── .terraform/
        └── providers/
            └── registry.terraform.io/
                └── hashicorp/
                    └── aws/
                        └── 5.100.0/
                            └── windows_amd64/
                                ├── LICENSE.txt
                                └── terraform-provider-aws_v5.100.0_x5.exe
```

###  Componentes Principales

| Componente | Tecnología | Propósito |
|------------|------------|-----------|
| **Computación** | EC2 t3.micro | Host para aplicación Dockerizada |
| **Contenedores** | Docker + Node.js 18 | Runtime de la aplicación |
| **IaC** | Terraform 1.14.0 | Infraestructura como código |
| **CI/CD** | GitHub Actions | Pipeline automatizado |
| **Almacenamiento** | S3 + EBS gp3 | Archivos estáticos y datos |
| **Seguridad** | IAM Roles + Security Groups | Control de acceso |
| **Monitoreo** | CloudWatch Logs | Logs y métricas |

### Demo pública: http://3.17.37.152/

### AWS Services
- **EC2**: Instancia t3.micro (Amazon Linux 2023)
- **S3**: Bucket para almacenamiento (`jikkosoft-app-storage-dev`)
- **IAM**: Roles y políticas de seguridad
- **CloudWatch**: Logs y monitoreo
- **VPC**: Red virtual por defecto
- **SSM**: System Manager para ejecución remota

###  Herramientas de DevOps
- **Terraform** 1.14.0 - Infraestructura como código
- **Docker** - Containerización de aplicaciones
- **GitHub Actions** - CI/CD pipelines
- **Node.js** 18 - Runtime de aplicación

## Valores referencia:

- Instancia EC2: 

- Bucket S3: jikkosoft-app-storage-dev 

- Grupo de logs: jikkosoft-app-logs

- IAM Role: EC2-S3-AccessRole-jikkosoft

