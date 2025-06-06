#!/bin/bash

# Docker Goat - Script de Automatización
# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

PROJECT_NAME="docker-goat"
CONTAINER_NAME="docker-goat-container"
PORT="8080"

# Función para mostrar el banner
show_banner() {
    echo -e "${BLUE}"
    echo "🐐 ============================================"
    echo "   DOCKER GOAT - Script de Automatización"
    echo "   Aprendiendo Docker como un Profesional"
    echo "=============================================${NC}"
    echo
}

# Función para mostrar ayuda
show_help() {
    echo -e "${YELLOW}Uso: $0 [COMANDO]${NC}"
    echo
    echo "Comandos disponibles:"
    echo "  build     - Construir la imagen Docker"
    echo "  run       - Ejecutar el contenedor"
    echo "  stop      - Detener el contenedor"
    echo "  restart   - Reiniciar el contenedor"
    echo "  logs      - Ver logs del contenedor"
    echo "  clean     - Limpiar contenedores e imágenes"
    echo "  status    - Ver estado del contenedor"
    echo "  dev       - Modo desarrollo con docker-compose"
    echo "  help      - Mostrar esta ayuda"
    echo
    echo -e "${BLUE}Ejemplos:${NC}"
    echo "  $0 build   # Construir la imagen"
    echo "  $0 run     # Ejecutar el contenedor"
    echo "  $0 logs    # Ver logs en tiempo real"
}

# Función para construir la imagen
build_image() {
    echo -e "${YELLOW}🔨 Construyendo imagen Docker...${NC}"
    docker build -t $PROJECT_NAME .
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Imagen construida exitosamente${NC}"
    else
        echo -e "${RED}❌ Error al construir la imagen${NC}"
        exit 1
    fi
}

# Función para ejecutar el contenedor
run_container() {
    echo -e "${YELLOW}🚀 Ejecutando contenedor...${NC}"
    
    # Verificar si el contenedor ya existe
    if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
        echo -e "${YELLOW}⚠️  El contenedor ya existe. Deteniéndolo...${NC}"
        docker stop $CONTAINER_NAME > /dev/null 2>&1
        docker rm $CONTAINER_NAME > /dev/null 2>&1
    fi
    
    docker run -d -p $PORT:80 --name $CONTAINER_NAME $PROJECT_NAME
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Contenedor ejecutándose exitosamente${NC}"
        echo -e "${BLUE}🌐 Visita: http://localhost:$PORT${NC}"
    else
        echo -e "${RED}❌ Error al ejecutar el contenedor${NC}"
        exit 1
    fi
}

# Función para detener el contenedor
stop_container() {
    echo -e "${YELLOW}🛑 Deteniendo contenedor...${NC}"
    docker stop $CONTAINER_NAME
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Contenedor detenido${NC}"
    else
        echo -e "${RED}❌ Error al detener el contenedor${NC}"
    fi
}

# Función para reiniciar el contenedor
restart_container() {
    echo -e "${YELLOW}🔄 Reiniciando contenedor...${NC}"
    docker restart $CONTAINER_NAME
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Contenedor reiniciado${NC}"
        echo -e "${BLUE}🌐 Visita: http://localhost:$PORT${NC}"
    else
        echo -e "${RED}❌ Error al reiniciar el contenedor${NC}"
    fi
}

# Función para ver logs
show_logs() {
    echo -e "${YELLOW}📋 Mostrando logs del contenedor...${NC}"
    docker logs -f $CONTAINER_NAME
}

# Función para limpiar recursos
clean_resources() {
    echo -e "${YELLOW}🧹 Limpiando recursos Docker...${NC}"
    
    # Detener y eliminar contenedor
    docker stop $CONTAINER_NAME > /dev/null 2>&1
    docker rm $CONTAINER_NAME > /dev/null 2>&1
    
    # Eliminar imagen
    docker rmi $PROJECT_NAME > /dev/null 2>&1
    
    # Limpiar imágenes no utilizadas
    docker image prune -f > /dev/null 2>&1
    
    echo -e "${GREEN}✅ Limpieza completada${NC}"
}

# Función para ver estado
show_status() {
    echo -e "${YELLOW}📊 Estado del proyecto Docker Goat:${NC}"
    echo
    
    # Estado del contenedor
    if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        echo -e "${GREEN}✅ Contenedor: EJECUTÁNDOSE${NC}"
        echo -e "${BLUE}🌐 URL: http://localhost:$PORT${NC}"
    elif [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
        echo -e "${YELLOW}⏸️  Contenedor: DETENIDO${NC}"
    else
        echo -e "${RED}❌ Contenedor: NO ENCONTRADO${NC}"
    fi
    
    # Estado de la imagen
    if [ "$(docker images -q $PROJECT_NAME)" ]; then
        echo -e "${GREEN}✅ Imagen: DISPONIBLE${NC}"
    else
        echo -e "${RED}❌ Imagen: NO ENCONTRADA${NC}"
    fi
    
    echo
    echo -e "${BLUE}📈 Recursos utilizados:${NC}"
    docker stats $CONTAINER_NAME --no-stream 2>/dev/null || echo "Contenedor no ejecutándose"
}

# Función para modo desarrollo
dev_mode() {
    echo -e "${YELLOW}🔧 Iniciando modo desarrollo con docker-compose...${NC}"
    
    if [ ! -f "docker-compose.yml" ]; then
        echo -e "${RED}❌ Archivo docker-compose.yml no encontrado${NC}"
        exit 1
    fi
    
    docker-compose up -d
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Modo desarrollo iniciado${NC}"
        echo -e "${BLUE}🌐 Visita: http://localhost:$PORT${NC}"
        echo -e "${YELLOW}💡 Los cambios en sitio/ se reflejarán automáticamente${NC}"
    else
        echo -e "${RED}❌ Error al iniciar modo desarrollo${NC}"
    fi
}

# Función principal
main() {
    show_banner
    
    case "${1:-help}" in
        "build")
            build_image
            ;;
        "run")
            build_image
            run_container
            ;;
        "stop")
            stop_container
            ;;
        "restart")
            restart_container
            ;;
        "logs")
            show_logs
            ;;
        "clean")
            clean_resources
            ;;
        "status")
            show_status
            ;;
        "dev")
            dev_mode
            ;;
        "help"|*)
            show_help
            ;;
    esac
}

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker no está instalado. Por favor instala Docker primero.${NC}"
    exit 1
fi

# Verificar si Docker está ejecutándose
if ! docker info &> /dev/null; then
    echo -e "${RED}❌ Docker no está ejecutándose. Por favor inicia Docker.${NC}"
    exit 1
fi

# Ejecutar función principal
main "$@" 