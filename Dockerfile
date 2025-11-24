FROM node:18-alpine

# Crear directorio de trabajo
WORKDIR /app

# Copiar solo los package.json primero (mejor caché)
COPY package*.json ./

# Instalar dependencias de producción
RUN npm install --only=production

# Copiar código fuente
COPY . .

# Crear usuario no root
RUN addgroup -g 1001 -S nodejs \
  && adduser -S nextjs -u 1001 \
  && chown -R nextjs:nodejs /app

USER nextjs

# Exponer puerto
EXPOSE 3000

# Health check para Docker
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

# Comando por defecto
CMD ["node", "server.js"]
