# 🚀 Docker & Kubernetes Training

This project is a hands-on training to understand how to **dockerize a simple API**, run it with **Docker Compose**, and deploy it on **Kubernetes**.

## 📌 Objectives

- Develop a **mini application**
- **Dockerize** it and run it using **Docker Compose**
- Deploy the application on **Kubernetes**
- Implement **Monitoring with cAdvisor, Prometheus, and Grafana**
- Perform **Load Testing with \*\***`wrk`\*\*

## 📦 Technologies Used

- **Docker** 🐛
- **Docker Compose**
- **Kubernetes (K8s)** ☘️
- **Minikube** (optional for local testing)
- **Prometheus + Grafana** for monitoring 📊
- **cAdvisor** for container-level metrics 🏢
- **wrk** for load testing 🚀

---

## 📚 Setup & Usage

### **Prerequisites**

Ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Kubernetes CLI (kubectl)](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/) (optional for local Kubernetes testing)
- [wrk](https://github.com/wg/wrk) for stress testing

### **Clone the repository**

```sh
git clone https://github.com/lgauthier1/k8s-training.git
cd k8s-training
```

---

## 🚀 Fullstack Application with Vue.js, Nitro Backend, and Nginx

This project consists of a **Vue.js frontend**, a **Nitro (H3) backend**, and **Nginx as a reverse proxy**. It supports **local development**, **Dockerized deployment**, and includes **monitoring & stress testing**.

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
│   ├── nginx-loadbalancer.conf
│
│── monitoring/             # Monitoring setup (Prometheus + Grafana + cAdvisor)
│   ├── grafana/            # Grafana configuration
│   │   ├── dashboards/     # Pre-configured dashboards
│   │   │   ├── dashboard.yml
│   │   │   └── docker-dashboard.json
│   │   ├── datasources/    # Prometheus datasource for Grafana
│   │   │   └── grafana_datasources.yml
│   ├── prometheus.yml      # Prometheus configuration file
│
│── docker-compose.yml      # Docker orchestration (with Load Balancer and Replicas)
│── docker-compose.no-replica.yml  # Docker configuration (without Load Balancer and Replicas)
│── README.md               # Documentation
```

---

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

### 2️⃣ **Dockerized Deployment (Two Modes Available)**

#### **Mode 1: Simple Deployment (Without Load Balancer & Replicas)**

```sh
docker-compose -f docker-compose.no-replica.yml up --build
```

- Runs **a single instance of the backend**.
- No Load Balancer (Nginx is only used for serving the frontend).
- Access the API at `http://localhost/api/hello`.

#### **Mode 2: Production Deployment (With Load Balancer & Replicas)**

```sh
docker-compose up --build
```

- Runs **three instances of the backend** (`backend1`, `backend2`, `backend3`).
- Uses **NGINX as a Load Balancer** (accessible at `http://localhost:8080/api/hello`).
- The frontend remains accessible at `http://localhost/`.

#### **Stopping the Containers**

```sh
docker-compose down
```

---

## 📊 **Monitoring with Prometheus, Grafana & cAdvisor**

### **Monitoring Stack**

Our monitoring setup includes:

- ✅ **Prometheus** → Collects and stores container metrics
- ✅ **Grafana** → Visualizes metrics with pre-configured dashboards
- ✅ **cAdvisor** → Gathers CPU, memory, and network usage per container

### **1️⃣ Start Monitoring Services**

```sh
docker-compose up -d prometheus grafana cadvisor
```

### **2️⃣ Access Monitoring Tools**

- **Prometheus UI:** [http://localhost:9090](http://localhost:9090)
- **Grafana UI:** [http://localhost:3001](http://localhost:3001) (Default Login: admin/admin)
- **cAdvisor UI:** [http://localhost:8081](http://localhost:8081)

### **3️⃣ Pre-configured Grafana Dashboard**

- Automatically imported upon startup.
- Located in **`monitoring/grafana/dashboards/docker-dashboard.json`**.
- Uses Prometheus as the data source.

---

## 🏃️ **Stress Testing with \*\***`wrk`\*\*

Use `wrk` to simulate high traffic loads on the backend.

```sh
wrk -t12 -c400 -d30s http://localhost:8080/api/hello
```

---

## 📌 **Summary**

| Mode                      | Command                                                      | Backend     | Load Balancer        | Monitoring |
| ------------------------- | ------------------------------------------------------------ | ----------- | -------------------- | ---------- |
| **Simple Deployment**     | `docker-compose -f docker-compose.no-replica.yml up --build` | 1 instance  | ❌ Disabled          | ✅ Enabled |
| **Production Deployment** | `docker-compose up --build`                                  | 3 instances | ✅ Enabled on `8080` | ✅ Enabled |

🚀 **This project provides an easy-to-deploy fullstack solution with monitoring & performance testing!**

---

**Author:** Laurent Gauthier\
**Date:** February 2025
