# 🐐 Docker Goat

<div align="center">

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

**Aprendiendo Docker como un Profesional** 🚀

[Ver Demo](#-demo) • [Instalación](#-instalación) • [Uso](#-uso) • [Contribuir](#-contribuir)

</div>

---

## 📖 Descripción

Docker Goat es un proyecto educativo diseñado para aprender Docker de manera práctica y visual. Combina una interfaz web moderna con conceptos fundamentales de contenedores, proporcionando una experiencia de aprendizaje interactiva.

### ✨ Características

- 🎨 **Interfaz Moderna**: Diseño atractivo con efectos visuales
- 🐳 **Docker Ready**: Configuración lista para producción
- 📱 **Responsive**: Compatible con dispositivos móviles
- ⚡ **Rápido**: Servidor Nginx optimizado
- 🔧 **Fácil Setup**: Un solo comando para ejecutar

## 🚀 Instalación Rápida

### Prerrequisitos

- [Docker](https://www.docker.com/get-started) instalado en tu sistema
- Git (opcional, para clonar el repositorio)

### Método 1: Usando Docker (Recomendado)

```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/docker-goat.git
cd docker-goat

# Construir la imagen
docker build -t docker-goat .

# Ejecutar el contenedor
docker run -d -p 8080:80 --name docker-goat-container docker-goat
```

### Método 2: Docker Compose (Próximamente)

```bash
# Ejecutar con docker-compose (en desarrollo)
docker-compose up -d
```

## 🎯 Uso

Una vez ejecutado el contenedor, abre tu navegador y visita:

```
http://localhost:8080
```

### Comandos Útiles

```bash
# Ver contenedores en ejecución
docker ps

# Ver logs del contenedor
docker logs docker-goat-container

# Detener el contenedor
docker stop docker-goat-container

# Eliminar el contenedor
docker rm docker-goat-container

# Eliminar la imagen
docker rmi docker-goat
```

## 🛠️ Estructura del Proyecto

```
docker-goat/
├── 📁 sitio/
│   └── 📄 index.html      # Página web principal
├── 📄 Dockerfile         # Configuración de Docker
├── 📄 README.md          # Este archivo
└── 📄 .gitignore         # Archivos ignorados por Git
```

## 🧪 Demo

![Docker Goat Demo](https://via.placeholder.com/800x400/667eea/ffffff?text=Docker+Goat+Demo)

### Características de la Demo:

- ✅ Diseño glassmorphism moderno
- ✅ Animaciones CSS fluidas
- ✅ Efectos interactivos con el mouse
- ✅ Información de comandos Docker
- ✅ Diseño completamente responsive

## 🔧 Desarrollo

### Desarrollo Local

```bash
# Opción 1: Usar un servidor local simple
cd sitio
python -m http.server 8000

# Opción 2: Usar Live Server (VS Code)
# Instalar la extensión Live Server y hacer clic derecho > "Open with Live Server"
```

### Personalización

El diseño puede ser personalizado editando el archivo `sitio/index.html`:

- **Colores**: Modifica las variables CSS en el `<style>`
- **Contenido**: Cambia los textos y iconos
- **Animaciones**: Ajusta las animaciones CSS y JavaScript

## 🐳 Docker Avanzado

### Construcción Optimizada

```bash
# Construcción sin caché
docker build --no-cache -t docker-goat .

# Construcción con etiqueta específica
docker build -t docker-goat:v1.0 .

# Construcción para múltiples plataformas
docker buildx build --platform linux/amd64,linux/arm64 -t docker-goat .
```

### Variables de Entorno

```bash
# Ejecutar con variables personalizadas
docker run -d -p 8080:80 \
  -e NGINX_HOST=mi-dominio.com \
  --name docker-goat-container \
  docker-goat
```

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor:

1. 🍴 Haz fork del proyecto
2. 🌟 Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. 💾 Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push a la rama (`git push origin feature/AmazingFeature`)
5. 🔄 Abre un Pull Request

### Ideas para Contribuir

- 🎨 Mejoras en el diseño
- 📚 Más ejemplos de Docker
- 🌐 Internacionalización
- 📱 Mejoras en responsive
- 🧪 Tests automatizados

## 📋 Roadmap

- [ ] 🐙 Docker Compose configuration
- [ ] 🔄 CI/CD pipeline
- [ ] 📊 Monitoring dashboard
- [ ] 🌍 Multi-language support
- [ ] 📚 Interactive Docker tutorials
- [ ] 🎮 Gamification elements

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 👥 Autores

- **Tu Nombre** - _Trabajo Inicial_ - [@tu-usuario](https://github.com/tu-usuario)

## 🙏 Agradecimientos

- [Docker](https://www.docker.com/) por la increíble tecnología de contenedores
- [Nginx](https://nginx.org/) por el servidor web ligero y potente
- [Font Awesome](https://fontawesome.com/) por los iconos increíbles
- La comunidad open source por la inspiración constante

---

<div align="center">

**¿Te gustó este proyecto? ¡Dale una ⭐ en GitHub!**

[🐳 Aprende más sobre Docker](https://docs.docker.com/) | [🚀 Deploy en tu servidor](https://docs.docker.com/engine/install/)

</div>
