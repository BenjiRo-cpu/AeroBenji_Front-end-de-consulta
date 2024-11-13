FROM nginx:alpine

# Copia los archivos del proyecto al directorio donde Nginx busca los archivos estáticos
COPY . /usr/share/nginx/html/

# Renombra IndexSesión.html a index.html para que sea la página principal
RUN mv /usr/share/nginx/html/IndexSesión.html /usr/share/nginx/html/index.html

# Configura Nginx
RUN echo $'\
server { \n\
    listen 80; \n\
    server_name _; \n\
    root /usr/share/nginx/html; \n\
    index index.html; \n\
    location / { \n\
        try_files $uri $uri/ /index.html; \n\
    } \n\
}' > /etc/nginx/conf.d/default.conf

# Da permisos adecuados a los archivos copiados
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
