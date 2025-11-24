#!/bin/bash
set -e

# Log para debugging
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo "=== INICIANDO SCRIPT USER_DATA ==="

# Actualizar sistema
echo "Actualizando sistema..."
dnf update -y

# Instalar dependencias necesarias
echo "Instalando dependencias..."
dnf install -y tar gzip

# Instalar Docker
echo "Instalando Docker..."
dnf install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# CORRECCIÓN: Instalar Node.js para Amazon Linux 2023
echo "Instalando Node.js..."
dnf install -y nodejs npm

# Verificar instalaciones
echo "Verificando instalaciones..."
docker --version
node --version
npm --version

# Crear carpeta de la app
echo "Creando estructura de la aplicación..."
mkdir -p /home/ec2-user/app
cd /home/ec2-user/app

# Crear archivos de la aplicación
cat << 'EOF' > Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .
EXPOSE 3000
USER node
CMD ["node", "server.js"]
EOF

cat << 'EOF' > server.js
const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hola Mundo desde Terraform + EC2 + Docker! - Jikkosoft");
});

app.get("/health", (req, res) => {
  res.status(200).json({ status: "OK", timestamp: new Date().toISOString() });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log("App corriendo en puerto " + PORT);
});
EOF

cat << 'EOF' > package.json
{
  "name": "jikkosoft-app",
  "version": "1.0.0",
  "main": "server.js",
  "dependencies": {
    "express": "^4.18.2"
  }
}
EOF

# Configurar permisos
chown -R ec2-user:ec2-user /home/ec2-user/app
chmod -R 755 /home/ec2-user/app

# Esperar a que Docker esté completamente listo
echo "Esperando que Docker esté listo..."
sleep 20

# Construir imagen Docker
echo "Construyendo imagen Docker..."
docker build -t jikkosoft-app .

# Detener contenedores previos si existen
echo "Limpiando contenedores previos..."
docker stop jikkosoft-container || true
docker rm jikkosoft-container || true

# Ejecutar contenedor en puerto 80
echo "Ejecutando contenedor..."
docker run -d \
  --name jikkosoft-container \
  --restart always \
  -p 80:3000 \
  jikkosoft-app

# Esperar a que la aplicación esté lista
echo "Esperando que la aplicación inicie..."
sleep 30

# Verificaciones finales
echo "=== VERIFICACIONES FINALES ==="
echo "1. Contenedores en ejecución:"
docker ps

echo "2. Verificando salud de la aplicación..."
curl -f http://localhost:80/ || echo "La aplicación no responde en puerto 80"
curl -f http://localhost:80/health || echo "El endpoint de salud no responde"

echo "3. Puertos en escucha:"
netstat -tuln | grep :80 || echo "Puerto 80 no está en escucha"

echo "=== USER_DATA COMPLETADO ==="
