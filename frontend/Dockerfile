FROM node:20 AS build
WORKDIR /app

# Installer les dépendances et builder l'application
COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci
COPY frontend ./
RUN npm run build

# Étape finale : Servir avec Nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

# Copier la configuration Nginx depuis la racine ou le dossier nginx/
COPY ../nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]