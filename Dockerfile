# Usa una imagen base de Nginx
FROM nginx:latest

# Copia los archivos del proyecto al directorio donde Nginx busca los archivos estáticos
COPY . /usr/share/nginx/html

# Da permisos adecuados a los archivos copiados
RUN chmod -R 755 /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Inicia Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
