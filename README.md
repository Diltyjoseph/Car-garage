# 🚗 GaragePro — Smart Car Garage Management System

<div align="center">

![GaragePro](https://img.shields.io/badge/GaragePro-Smart%20Garage%20Management-blue?style=for-the-badge)
![React](https://img.shields.io/badge/React-18-61DAFB?style=flat&logo=react)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2-6DB33F?style=flat&logo=springboot)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat&logo=mysql)
![SerpApi](https://img.shields.io/badge/SerpApi-Integrated-orange?style=flat)

**A hackathon-ready, full-stack garage management system with real SerpApi web search integration.**

</div>

---

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Tech Stack](#tech-stack)
4. [Project Structure](#project-structure)
5. [Prerequisites](#prerequisites)
6. [Database Setup](#database-setup)
7. [Environment Variables](#environment-variables)
8. [Running the Backend](#running-the-backend)
9. [Running the Frontend](#running-the-frontend)
10. [Demo Login](#demo-login)
11. [SerpApi Setup](#serpapi-setup)
12. [API Documentation](#api-documentation)
13. [Hackathon Demo Script](#hackathon-demo-script)

---

## 🎯 Project Overview

**Problem:** Garage owners manually manage customers, vehicles, service records, and bills on paper — leading to errors, delays, and lost records.

**Solution:** GaragePro centralizes all garage operations into one modern digital platform.

**Innovation:** Real-time web search using SerpApi allows garage staff to find vehicle information, spare parts, compatible components, and pricing — directly while managing services.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🔐 Secure Login | JWT-based authentication |
| 👥 Customer Management | Add, edit, delete, search customers |
| 🚗 Vehicle Management | Register cars & bikes with full details |
| 🔧 Service Booking | Book services with mechanic assignment |
| 📊 Dashboard | Live stats, charts, today's appointments |
| 🔄 Status Tracking | BOOKED → IN PROGRESS → COMPLETED |
| 📜 Service History | Full history per vehicle |
| 🧾 Bill Generation | Auto-calculated bills with GST, print support |
| 🔍 SerpApi Search | Real web search for parts & vehicle info |
| 📱 Responsive | Works on desktop, tablet, and mobile |

---

## 🛠️ Tech Stack

### Frontend
- **React 18** + **Vite 5**
- **Tailwind CSS** — Dark navy automotive theme
- **React Router v6** — Client-side routing
- **Axios** — HTTP client with JWT interceptor
- **Recharts** — Dashboard charts
- **Lucide React** — Icons

### Backend
- **Java 17** + **Spring Boot 3.2**
- **Spring Security** + **JWT** — Authentication
- **Spring Data JPA** + **Hibernate** — ORM
- **OkHttp** — SerpApi HTTP calls
- **Lombok** — Boilerplate reduction
- **Bean Validation** — Input validation

### Database
- **MySQL 8.0** — Primary database
- **JPA/Hibernate** — Auto schema generation + `data.sql` seeding

### External API
- **SerpApi** — Real Google search results for spare parts & vehicle info

---

## 📁 Project Structure

```
car-garage/
├── backend/                          # Spring Boot Backend
│   ├── pom.xml
│   ├── .env                          # Your secrets (git-ignored)
│   └── src/main/java/com/garagepro/
│       ├── GarageProApplication.java
│       ├── DataInitializer.java      # Seeds admin user on startup
│       ├── model/                    # JPA Entities
│       │   ├── User.java
│       │   ├── Customer.java
│       │   ├── Vehicle.java          # Abstract base (OOP Inheritance)
│       │   ├── Car.java              # extends Vehicle
│       │   ├── Bike.java             # extends Vehicle
│       │   ├── Mechanic.java
│       │   ├── ServiceRecord.java
│       │   ├── ServicePart.java
│       │   ├── Bill.java
│       │   └── BillItem.java
│       ├── dto/                      # Data Transfer Objects
│       ├── repository/               # JpaRepository interfaces
│       ├── service/                  # Service interfaces
│       │   └── impl/                 # Service implementations
│       ├── controller/               # REST Controllers
│       ├── config/                   # JWT, Security, CORS
│       └── exception/                # Custom exceptions + GlobalHandler
│
├── frontend/                         # React + Vite Frontend
│   ├── package.json
│   ├── vite.config.js
│   ├── tailwind.config.js
│   ├── .env                          # VITE_API_URL
│   └── src/
│       ├── App.jsx                   # Routes + Auth Guard
│       ├── main.jsx
│       ├── index.css                 # Tailwind + custom classes
│       ├── context/
│       │   ├── AuthContext.jsx       # Login state, JWT storage
│       │   └── ToastContext.jsx      # Toast notifications
│       ├── services/                 # Axios API calls
│       │   ├── api.js                # Axios instance + interceptors
│       │   ├── authService.js
│       │   ├── customerService.js
│       │   ├── vehicleService.js
│       │   ├── mechanicService.js
│       │   ├── serviceService.js
│       │   ├── billService.js
│       │   ├── searchService.js
│       │   └── dashboardService.js
│       ├── components/               # Reusable UI components
│       │   ├── Layout.jsx
│       │   ├── Sidebar.jsx
│       │   ├── Header.jsx
│       │   ├── StatCard.jsx
│       │   ├── Modal.jsx
│       │   ├── ConfirmDialog.jsx
│       │   ├── StatusBadge.jsx
│       │   ├── LoadingSpinner.jsx
│       │   ├── EmptyState.jsx
│       │   └── forms/
│       │       ├── CustomerForm.jsx
│       │       ├── VehicleForm.jsx
│       │       ├── MechanicForm.jsx
│       │       ├── ServiceForm.jsx
│       │       └── BillForm.jsx
│       └── pages/
│           ├── LoginPage.jsx
│           ├── DashboardPage.jsx
│           ├── CustomersPage.jsx
│           ├── VehiclesPage.jsx
│           ├── VehicleDetailPage.jsx
│           ├── MechanicsPage.jsx
│           ├── ServicesPage.jsx
│           ├── ServiceBookingPage.jsx
│           ├── BillingPage.jsx
│           ├── BillDetailPage.jsx
│           ├── SearchPage.jsx
│           └── AboutPage.jsx
│
├── .env.example                      # Template for environment variables
├── .gitignore
└── README.md
```

---

## ⚙️ Prerequisites

Before running the project, make sure you have:

| Tool | Version | Check Command |
|------|---------|---------------|
| Java JDK | 17 or higher | `java -version` |
| Maven | 3.8+ | `mvn -version` |
| Node.js | 18 or higher | `node -v` |
| npm | 9+ | `npm -v` |
| MySQL | 8.0 | `mysql --version` |

---

## 🗄️ Database Setup

### Step 1: Start MySQL
Make sure MySQL is running on your machine.

### Step 2: Create Database
Open your MySQL terminal or MySQL Workbench and run:

```sql
CREATE DATABASE IF NOT EXISTS garagepro;
```

> **Note:** The Spring Boot app will auto-create the database if `createDatabaseIfNotExist=true` is in the connection URL (already configured).

### Step 3: Verify Connection
```sql
SHOW DATABASES;
-- You should see 'garagepro' in the list
```

### MySQL Credentials
Default config uses:
- Username: `root`
- Password: `root`

If your MySQL password is different, update `backend/.env`:
```
DB_PASSWORD=your_actual_password
```

---

## 🔑 Environment Variables

### Backend (`backend/.env`)
```env
DB_URL=jdbc:mysql://localhost:3306/garagepro?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true
DB_USERNAME=root
DB_PASSWORD=root
JWT_SECRET=garagepro_super_secret_jwt_key_2026_hackathon
SERPAPI_KEY=your_serpapi_key_here
```

### Frontend (`frontend/.env`)
```env
VITE_API_URL=http://localhost:8080/api
```

---

## 🚀 Running the Backend

### Option 1: Using Maven directly (recommended)
```bash
cd backend
mvn spring-boot:run
```

### Option 2: With environment variables (Windows PowerShell)
```powershell
cd backend
$env:DB_PASSWORD="your_password"; $env:SERPAPI_KEY="your_key"; mvn spring-boot:run
```

### Option 3: Build JAR and run
```bash
cd backend
mvn clean package -DskipTests
java -jar target/garagepro-backend-0.0.1-SNAPSHOT.jar
```

### What happens on startup:
1. ✅ Spring Boot connects to MySQL
2. ✅ Hibernate creates/updates all tables automatically
3. ✅ `data.sql` inserts demo customers, vehicles, mechanics, services, bills
4. ✅ `DataInitializer` creates the admin user with BCrypt-hashed password
5. ✅ Server starts on `http://localhost:8080`

---

## 🌐 Running the Frontend

```bash
cd frontend
npm install
npm run dev
```

Frontend starts on: **http://localhost:5173**

> The Vite proxy automatically forwards `/api` requests to `http://localhost:8080`.

---

## 🔐 Demo Login

| Field | Value |
|-------|-------|
| Email | `admin@garagepro.com` |
| Password | `admin123` |

---

## 🔍 SerpApi Setup

1. Go to [serpapi.com](https://serpapi.com) and create a free account
2. Find your API key in the dashboard
3. Add it to `backend/.env`:
   ```
   SERPAPI_KEY=your_actual_key_here
   ```
4. Restart the backend

> **Free tier:** 100 searches/month — more than enough for a hackathon demo.

### Where SerpApi is used:
- **Garage Search** (`/search`) — Free-text search for any automotive topic
- **Find Spare Parts** (`/search`) — Search by Brand + Model + Year + Part
- **Vehicle Info** (`/vehicles/:id`) — Auto-search for vehicle maintenance info

---

## 📡 API Documentation

### Authentication
```
POST /api/auth/login
Body: { "email": "admin@garagepro.com", "password": "admin123" }
Response: { "token": "...", "email": "...", "name": "..." }
```

### Customers
```
GET    /api/customers              — List all customers
POST   /api/customers              — Create customer
PUT    /api/customers/{id}         — Update customer
DELETE /api/customers/{id}         — Delete customer
GET    /api/customers/search?q=    — Search customers
```

### Vehicles
```
GET    /api/vehicles               — List all vehicles
POST   /api/vehicles               — Register vehicle
PUT    /api/vehicles/{id}          — Update vehicle
DELETE /api/vehicles/{id}          — Delete vehicle
GET    /api/vehicles/{id}          — Get vehicle details
GET    /api/vehicles/search?q=     — Search vehicles
GET    /api/vehicles/customer/{id} — Vehicles by customer
```

### Mechanics
```
GET    /api/mechanics              — List all mechanics
POST   /api/mechanics              — Add mechanic
PUT    /api/mechanics/{id}         — Update mechanic
DELETE /api/mechanics/{id}         — Delete mechanic
```

### Services
```
GET    /api/services               — All service records
POST   /api/services               — Book a service
PUT    /api/services/{id}/status   — Update service status
GET    /api/services/{id}          — Get service details
GET    /api/services/vehicle/{id}  — Service history for vehicle
GET    /api/services/today         — Today's appointments
```

### Billing
```
POST   /api/bills                  — Generate bill
GET    /api/bills                  — All bills
GET    /api/bills/{id}             — Get bill by ID
GET    /api/bills/service/{id}     — Get bill for service
```

### Search (SerpApi)
```
GET    /api/search?q=query                              — General search
GET    /api/search/parts?brand=&model=&year=&part=      — Spare parts search
```

### Dashboard
```
GET    /api/dashboard/stats           — All statistics
GET    /api/dashboard/global-search?q — Search entire database
```

---

## 🎭 Hackathon Demo Script

Follow this exact flow for a smooth demo:

### Step 1 — Login (30 sec)
- Open `http://localhost:5173`
- Login with `admin@garagepro.com` / `admin123`
- Point out: "Secure JWT authentication"

### Step 2 — Dashboard (1 min)
- Show statistics cards (customers, vehicles, revenue)
- Show charts (monthly revenue, service distribution)
- Show today's appointments
- Point out: "All data is live from MySQL database"

### Step 3 — Add Customer (1 min)
- Click **Customers** → **+ Add Customer**
- Enter: Name: "Arjun Krishnan", Phone: "9847556677", Email: "arjun@email.com"
- Click Save → toast notification appears

### Step 4 — Register Vehicle (1 min)
- Click **Vehicles** → **+ Add Vehicle**
- Select the new customer
- Enter: Registration: "KL 09 XY 4321", Brand: Hyundai, Model: i20, Year: 2023, Fuel: Petrol
- Click Save

### Step 5 — Book Service (1 min)
- Click **Services** → **Book Service**
- Select customer, vehicle, Service Type: "Brake Service"
- Set today's date, assign mechanic: Mohammed Ali
- Estimated cost: 3500
- Click Book → show confirmation screen with Booking ID

### Step 6 — SerpApi Demo (2 min) ⭐ KEY FEATURE
- Click **Spare Parts Search** in sidebar
- Tab: **Find Spare Parts**
- Enter: Brand: Hyundai, Model: i20, Year: 2023, Part: Brake Pad
- Click Search → loading animation → real results from Google
- Show result cards with titles, sources, snippets
- Point out: "These are real web results — powered by SerpApi"

### Step 7 — Update Status (30 sec)
- Go to **Services**
- Find the booked service → update status to "IN PROGRESS"
- Badge changes color to orange

### Step 8 — Generate Bill (1 min)
- Click **Billing** → **Generate New Bill**
- Select the service
- Add items: "Brake Service" ₹2000, "Brake Pads Set" ₹1200, "Brake Fluid" ₹300
- GST auto-calculates at 18%
- Click Generate Bill

### Step 9 — View & Print Bill (30 sec)
- Click View on the generated bill
- Show professional invoice layout
- Click Print → browser print dialog
- Point out: "Professional invoice with GST calculation"

### Step 10 — Service History (30 sec)
- Click **Vehicles** → Click on any vehicle
- Show complete service history timeline
- Click "Search Vehicle Information" → SerpApi returns vehicle specs

### Total Demo Time: ~10 minutes ✅

---

## 🏗️ OOP Concepts Demonstrated

| Concept | Where |
|---------|-------|
| **Inheritance** | `Vehicle` → `Car`, `Bike` |
| **Polymorphism** | `getVehicleCategory()` overridden in each subclass |
| **Abstraction** | `Vehicle` is abstract, Service interfaces |
| **Encapsulation** | Private fields with Lombok `@Data` getters/setters |
| **Interfaces** | `CustomerService`, `VehicleService`, `SearchService`, etc. |

---

## 👥 Team

Built with ❤️ for the Hackathon 2026

---

*GaragePro — Digitizing garage operations, one service at a time.*
