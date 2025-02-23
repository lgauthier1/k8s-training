#!/bin/bash

PROJECT_NAME="k8s-training"

echo "🚀 Cleaning Docker environment for project: $PROJECT_NAME"

# 1️⃣ Arrêter tous les conteneurs du projet
echo "🛑 Stopping containers..."
docker-compose down

# 2️⃣ Supprimer tous les conteneurs liés au projet
echo "🗑️ Removing containers..."
docker ps -a | grep $PROJECT_NAME | awk '{print $1}' | xargs -r docker rm -f

# 3️⃣ Supprimer les images liées au projet
echo "📦 Removing images..."
docker images | grep $PROJECT_NAME | awk '{print $3}' | xargs -r docker rmi -f

# 4️⃣ Supprimer les volumes Docker liés au projet
echo "🗄️ Removing volumes..."
docker volume ls | grep $PROJECT_NAME | awk '{print $2}' | xargs -r docker volume rm

# 5️⃣ Supprimer les réseaux Docker liés au projet
echo "🌐 Removing networks..."
docker network ls | grep $PROJECT_NAME | awk '{print $1}' | xargs -r docker network rm

echo "✅ Docker environment cleaned successfully!"