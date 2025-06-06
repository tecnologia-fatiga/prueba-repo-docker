# Usar imagen oficial de Nginx basada en Alpine para menor tamaño
FROM nginx:1.25-alpine

# Metadatos de la imagen
LABEL maintainer="tu-email@ejemplo.com" \
      version="1.0" \
      description="Docker Goat - Aplicación web educativa para aprender Docker"

# Instalar curl para healthchecks
RUN apk add --no-cache curl

# Crear usuario no-root para mayor seguridad
RUN addgroup -g 1001 -S nginx-user && \
    adduser -S -D -H -u 1001 -h /var/cache/nginx -s /sbin/nologin -G nginx-user -g nginx-user nginx-user

# Copiar archivos del sitio web
COPY --chown=nginx-user:nginx-user sitio/ /usr/share/nginx/html/

# Copiar configuración personalizada de nginx (opcional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Exponer puerto 80
EXPOSE 80

# Healthcheck para verificar que el servicio esté funcionando
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:80/ || exit 1

# Comando por defecto
CMD ["nginx", "-g", "daemon off;"]