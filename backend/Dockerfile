FROM node:20 AS build

# Définition du répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances et installer avec npm ci pour une installation propre
COPY package.json package-lock.json ./
RUN npm ci

# Copier le reste du code source
COPY . .

# Construire l'application Nitro (si nécessaire)
RUN npm run build

# Utiliser une image légère pour l'exécution
FROM node:20-alpine
WORKDIR /app

# Copier uniquement les fichiers nécessaires depuis l'étape de build
COPY --from=build /app /app

# Exposer le port utilisé par Nitro
EXPOSE 3000

# Démarrer l'application Nitro
CMD ["node", ".output/server/index.mjs"]
