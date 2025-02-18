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
- **Prometheus + Grafana** for monitoring  
- **wrk** for load testing  

## 📖 Setup & Usage  

### Prerequisites  
Ensure you have the following installed:  
- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  
- [Kubernetes CLI (kubectl)](https://kubernetes.io/docs/tasks/tools/install-kubectl/)  
- [Minikube](https://minikube.sigs.k8s.io/docs/start/) (optional for local Kubernetes testing)  
- [wrk](https://github.com/wg/wrk) for stress testing  

### Clone the repository  
```bash
git clone https://github.com/lgauthier1/k8s-training.git
cd k8s-training
```

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
│   ├── prometheus.yml
│   ├── grafana/
│   ├── cadvisor/
│
│── docker-compose.yml      # Docker orchestration (with Load Balancer and Replicas)
│── docker-compose.no-replica.yml  # Docker configuration (without Load Balancer and Replicas)
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

## 📊 Monitoring with Prometheus + Grafana + cAdvisor
### **Setup and Usage**
#### **Start Monitoring Stack**
```sh
docker-compose up -d prometheus grafana cadvisor
```
#### **Access Monitoring Tools**
- **Prometheus UI:** [http://localhost:9090](http://localhost:9090)
- **Grafana UI:** [http://localhost:3001](http://localhost:3001) (Default Login: admin/admin)
- **cAdvisor UI:** [http://localhost:8081](http://localhost:8081)

#### **Pre-configured Grafana Dashboard**
- Automatically imported upon startup.
- Monitors **CPU, Memory, Network, and active containers**.
- Uses Prometheus as a data source.

---

## 🏎️ Stress Testing with `wrk`
To analyze performance and scalability, use `wrk`:
#### **Basic Load Test**
```sh
wrk -t12 -c400 -d30s http://localhost:8080/api/hello
```
- `-t12` → 12 threads
- `-c400` → 400 concurrent connections
- `-d30s` → Run the test for 30 seconds

#### **Analyze Results**
Example output:
```sh
Running 30s test @ http://localhost:8080/api/hello
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    48.81ms   40.49ms 295.96ms   83.61%
    Req/Sec   405.27    358.63     1.59k    76.75%
  106299 requests in 30.09s, 32.74MB read
Requests/sec:   3532.36
Transfer/sec:      1.09MB
```
✅ **Use these metrics to optimize scalability and performance!**

---

## 📌 Summary
| Mode | Command | Backend | Load Balancer | Monitoring |
|------|---------|---------|---------------|------------|
| **Simple Deployment** | `docker-compose -f docker-compose.no-replica.yml up --build` | 1 instance | ❌ Disabled | ✅ Enabled |
| **Production Deployment** | `docker-compose up --build` | 3 instances | ✅ Enabled on `8080` | ✅ Enabled |

This project provides an easy-to-deploy **Vue.js + Nitro + Nginx** fullstack solution with **Monitoring & Load Testing** 🚀

---

**Author:** Laurent Gauthier  
**Date:** February 2025