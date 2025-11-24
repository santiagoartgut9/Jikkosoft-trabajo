# Jikkosoft - Infraestructura Cloud & DevOps

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Infrastructure-Terraform-purple)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-green)
![Node.js](https://img.shields.io/badge/Runtime-Node.js-brightgreen)

### 🔧 Componentes Principales

| Componente | Tecnología | Propósito |
|------------|------------|-----------|
| **Computación** | EC2 t3.micro | Host para aplicación Dockerizada |
| **Contenedores** | Docker + Node.js 18 | Runtime de la aplicación |
| **IaC** | Terraform 1.14.0 | Infraestructura como código |
| **CI/CD** | GitHub Actions | Pipeline automatizado |
| **Almacenamiento** | S3 + EBS gp3 | Archivos estáticos y datos |
| **Seguridad** | IAM Roles + Security Groups | Control de acceso |
| **Monitoreo** | CloudWatch Logs | Logs y métricas |

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

