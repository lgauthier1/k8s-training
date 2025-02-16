# 🚀 Docker & Kubernetes Training

This project is a hands-on training to understand how to **dockerize a simple API**, run it with **Docker Compose**, and deploy it on **Kubernetes**.

## 📌 Objectives  
- Develop a **mini application**  
- **Dockerize** it and run it using **Docker Compose**  
- Deploy the application on **Kubernetes**  

## 📦 Technologies Used  
- **Docker** 🐳  
- **Docker Compose**  
- **Kubernetes (K8s)** ☸️  
- **Minikube** (optional for local testing)  

## 📖 Setup & Usage  

### Prerequisites  
Ensure you have the following installed:  
- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  
- [Kubernetes CLI (kubectl)](https://kubernetes.io/docs/tasks/tools/install-kubectl/)  
- [Minikube](https://minikube.sigs.k8s.io/docs/start/) (optional for local Kubernetes testing)  

### Clone the repository  
```bash
git clone https://github.com/lgauthier1/k8s-training.git
cd k8s-training
```

## 🚀 Fullstack Application with Vue.js, Nitro Backend, and Nginx

This project consists of a **Vue.js frontend**, a **Nitro (H3) backend**, and **Nginx as a reverse proxy**. It supports **local development** and **Dockerized deployment** using `docker-compose`.

## 📁 Project Structure
```
mini-app/
│── backend/                # Nitro (H3) API backend
│   ├── Dockerfile
│   ├── package.json
│   ├── nitro.config.ts
│   ├── src/
│
│── frontend/               # Vue.js frontend
│   ├── Dockerfile
│   ├── package.json
│   ├── vite.config.ts
│   ├── src/
│
│── nginx/                  # Nginx configuration
│   ├── nginx.conf
│
│── docker-compose.yml      # Docker orchestration
│── README.md               # Documentation
```

## 🛠️ Setup and Installation

### 1️⃣ **Local Development (without Docker)**
#### **Backend Setup**
```sh
cd backend
npm install
npm run dev
```
The backend runs on `http://localhost:3000/`.

#### **Frontend Setup**
```sh
cd frontend
npm install
npm run dev
```
The frontend runs on `http://localhost:5173/`.

To test, visit `http://localhost:5173/`, which calls the backend API at `http://localhost:3000/api/hello`.

---

### 2️⃣ **Dockerized Deployment (Production Mode)**
#### **Build and Run Everything with Docker**
```sh
docker-compose up --build
```
The services included:
- **Backend:** Runs on `http://backend:3000`
- **Frontend:** Accessible via Nginx on `http://localhost/`
- **API Proxy:** Frontend calls `http://localhost/api/hello`, which is proxied to `http://backend:3000/api/hello`

#### **Stopping the Containers**
```sh
docker-compose down
```

---

## 📝 Environment Variables
### **Frontend (`.env` files)**
- **Local Development (`frontend/.env`)**:
  ```env
  VITE_API_URL=http://localhost:3000
  ```
- **Production (`frontend/.env.production`)**:
  ```env
  VITE_API_URL=/api
  ```

This allows the frontend to dynamically switch API endpoints.

---

## 🔥 Troubleshooting
### **Common Issues and Fixes**
| Issue | Solution |
|--------|-----------|
| CORS error in frontend | Ensure Nitro allows CORS in `nitro.config.ts` |
| `server` directive error in Nginx | Check `nginx.conf` format and copy it correctly |
| Vue.js build fails (TS7016 error) | Add `shims-vue.d.ts` and configure TypeScript |
| Dockerized frontend not calling backend | Verify `VITE_API_URL` settings |

---

## 📌 Summary
| Mode | Command | Notes |
|------|---------|-------|
| **Local Development** | `npm run dev` | Runs frontend & backend separately |
| **Docker Build & Run** | `docker-compose up --build` | Full deployment in containers |
| **Stop Containers** | `docker-compose down` | Stops and removes all containers |

This project provides an easy-to-deploy **Vue.js + Nitro + Nginx** fullstack solution. 🚀

---

**Author:** Laurent Gauthier  
**Date:** February 2025

