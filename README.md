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
    ├── 
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

## Metricas: 

<img width="550" height="347" alt="image" src="https://github.com/user-attachments/assets/c24bd74a-bd38-4167-9400-143d5cc96f39" />

<img width="1073" height="353" alt="image" src="https://github.com/user-attachments/assets/8804b87f-6ed8-4fbd-bbf7-2816bba18e62" />

<img width="1054" height="292" alt="image" src="https://github.com/user-attachments/assets/c7309320-c74f-41e0-b814-95501ddb9a94" />

<img width="837" height="343" alt="image" src="https://github.com/user-attachments/assets/0da90e11-baaf-435f-bde6-e380558e41da" />


#  Evidencias

<img width="478" height="159" alt="image" src="https://github.com/user-attachments/assets/f2b919a8-0482-461a-a0ca-80df636ff885" />
<img width="523" height="351" alt="image" src="https://github.com/user-attachments/assets/ce7200d4-971e-461d-ab09-0f6a742b4194" />
<img width="510" height="374" alt="image" src="https://github.com/user-attachments/assets/9ccf6903-8bb5-4b35-892a-039fd0daee71" />
<img width="471" height="431" alt="image" src="https://github.com/user-attachments/assets/7e889002-4f71-4b6c-8edb-690d718c8a92" />
<img width="497" height="430" alt="image" src="https://github.com/user-attachments/assets/f4ee83f9-ef42-4f70-8603-ee2543f69414" />
<img width="476" height="254" alt="image" src="https://github.com/user-attachments/assets/c27ee210-58b8-41a9-bfaa-18a736fbdfd1" />
<img width="570" height="445" alt="image" src="https://github.com/user-attachments/assets/a39bb638-b4f4-4641-9046-f77f14e4ef55" />
<img width="509" height="450" alt="image" src="https://github.com/user-attachments/assets/763870c2-fcd5-496a-9288-e252ae6a8613" />
<img width="496" height="204" alt="image" src="https://github.com/user-attachments/assets/723c698f-bcee-4154-8a47-0e2e4cd6dd82" />











