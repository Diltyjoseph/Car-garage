# GaragePro — Smart Car Garage Management System
## Project Build Summary

> **Hackathon Project** | B.Tech | Team of 5 | Built with React + Spring Boot + MySQL + SerpApi

---

## 👥 Our Team

| # | Name | Role |
|---|---|---|
| 1 | **Dilty Joseph** | Frontend Developer |
| 2 | **Devapriya T** | UI/UX + Testing & Documentation |
| 3 | **Devika Kumbalath Nishi** | Backend / Java Developer |
| 4 | **Fahma K T** | Database Developer |
| 5 | **Gayathri S** | SerpApi & Integration |

---

## 🗂️ Project Structure

```
car-garage/
├── backend/                        ← Spring Boot (Java)
│   ├── src/main/java/com/garagepro/
│   │   ├── model/                  ← JPA Entities (10 classes)
│   │   ├── dto/                    ← Data Transfer Objects (12 classes)
│   │   ├── repository/             ← Spring Data JPA Repositories (8 interfaces)
│   │   ├── service/                ← Service interfaces + implementations
│   │   │   └── impl/               ← 8 service implementations
│   │   ├── controller/             ← REST API Controllers (8 controllers)
│   │   ├── config/                 ← JWT, Security, CORS configuration
│   │   ├── exception/              ← Global exception handler
│   │   ├── DataInitializer.java    ← Seeds admin user on startup
│   │   └── GarageProApplication.java
│   ├── src/main/resources/
│   │   ├── application.properties  ← DB, JWT, SerpApi config
│   │   └── data.sql                ← Demo seed data (INSERT IGNORE)
│   ├── .env                        ← Secret keys (gitignored)
│   ├── pom.xml                     ← Maven dependencies
│   └── target/
│       └── garagepro-backend-0.0.1-SNAPSHOT.jar  ← BUILT & READY ✅
│
├── frontend/                       ← React + Vite + Tailwind CSS
│   ├── src/
│   │   ├── pages/                  ← 12 full pages
│   │   ├── components/             ← Reusable UI components
│   │   ├── services/               ← API service files (8 files)
│   │   ├── context/                ← Auth + Toast context
│   │   └── App.jsx                 ← Routes + AuthGuard
│   ├── dist/                       ← Production build ✅
│   └── .env
│
├── start-backend.ps1               ← One-click backend starter
├── start-frontend.ps1              ← One-click frontend starter
├── README.md
└── .gitignore
```

---

## ✅ What Was Built

### Backend — Spring Boot 3.2.3 (Java 21 target, JDK 26)

#### Models (JPA Entities)
| File | Description |
|---|---|
| `User.java` | Admin user with email, password (BCrypt), role |
| `Customer.java` | Customer with name, phone, email, address |
| `Vehicle.java` | **Abstract base class** — OOP inheritance demo |
| `Car.java` | Extends Vehicle — has doors, bodyType |
| `Bike.java` | Extends Vehicle — has bikeType |
| `Mechanic.java` | Name, specialization, experience, availability |
| `ServiceRecord.java` | Full service booking with parts list |
| `ServicePart.java` | Parts used in a service |
| `Bill.java` | Invoice with GST, discount, grand total |
| `BillItem.java` | Line items in a bill |

> **OOP Feature**: `Vehicle` is abstract with `getVehicleCategory()` — `Car` returns "Car", `Bike` returns "Bike". Uses `SINGLE_TABLE` inheritance with discriminator column.

#### REST API Controllers
| Controller | Endpoint Base | Operations |
|---|---|---|
| `AuthController` | `/api/auth` | POST /login |
| `CustomerController` | `/api/customers` | GET, POST, PUT, DELETE, search |
| `VehicleController` | `/api/vehicles` | GET, POST, PUT, DELETE, search, by-customer |
| `MechanicController` | `/api/mechanics` | Full CRUD |
| `ServiceController` | `/api/services` | GET, POST, PUT status, today's list |
| `BillController` | `/api/bills` | Generate, list, by-service |
| `SearchController` | `/api/search` | SerpApi web search + parts search |
| `DashboardController` | `/api/dashboard` | Stats, global search |

#### Security
- **JWT Authentication** — HS256, 24-hour tokens
- **Spring Security** — Stateless sessions, all endpoints protected except `/api/auth/login`
- **CORS** — Allows `localhost:5173` and `localhost:3000`
- **BCrypt** — Password hashing for admin user

#### SerpApi Integration
- `SearchServiceImpl.java` — Uses OkHttp to call SerpApi Google search
- Searches `organic_results` from JSON response
- Supports free-text search AND structured parts search
- Key: loaded from `SERPAPI_KEY` environment variable
- **Key**: `a76beda96496631e8f6b08840c3f8583cfb2042fb777f9813365d7393320d8c5`

#### Seed Data (`data.sql`)
- 5 Kerala customers (Indian names, KL phone numbers)
- 7 vehicles (KL registration format — e.g., `KL 07 AB 1234`)
- 4 mechanics with specializations
- 8 service records (various statuses)
- 3 bills with items, GST, totals
- Demo login created by `DataInitializer.java`: `admin@garagepro.com` / `admin123`

#### Key Fix Applied
> **Problem**: Lombok 1.18.30 is incompatible with Java 26 (`TypeTag::UNKNOWN` crash)  
> **Solution**: Removed all Lombok from all 65 Java files — replaced with explicit getters, setters, and constructors. Backend now compiles cleanly with `javac --release 21`.

---

### Frontend — React 18 + Vite + Tailwind CSS

#### Pages (12 total)
| Page | File | Features |
|---|---|---|
| Login | `LoginPage.jsx` | Email/password, show/hide, demo credentials shown |
| Dashboard | `DashboardPage.jsx` | Live stats cards, bar/pie/line charts, today's appointments, quick actions |
| Customers | `CustomersPage.jsx` | Search, table, add/edit/delete modals, ConfirmDialog |
| Vehicles | `VehiclesPage.jsx` | Search, CAR/BIKE type form, customer dropdown |
| Vehicle Detail | `VehicleDetailPage.jsx` | Full history, SerpApi search button |
| Mechanics | `MechanicsPage.jsx` | Full CRUD, availability badge |
| Services | `ServicesPage.jsx` | 4 tabs (All/Today/Pending/Completed), inline status update |
| Book Service | `ServiceBookingPage.jsx` | Customer→Vehicle cascade dropdown, booking confirmation card |
| Billing | `BillingPage.jsx` | All bills table, generate bill modal with live total |
| Bill Detail | `BillDetailPage.jsx` | Professional invoice layout, Print button |
| Spare Parts Search | `SearchPage.jsx` | 2 tabs — free search + structured parts search via SerpApi |
| About + Team | `AboutPage.jsx` | Problem/solution/tech stack + 5 team member cards |

#### Components
- `Layout.jsx` — Sidebar + header shell, mobile hamburger menu
- `Sidebar.jsx` — NavLinks with icons + "Our Team" link
- `Header.jsx` — Global search bar, user info, logout
- `StatusBadge.jsx` — Color-coded status chips
- `Modal.jsx` — Reusable backdrop modal
- `ConfirmDialog.jsx` — Delete confirmation popup
- `Toast.jsx` / `ToastContext.jsx` — Auto-dismiss notifications
- `LoadingSpinner.jsx` — Centered spinner
- `EmptyState.jsx` — Empty data message
- `StatCard.jsx` — Dashboard stat card with icon
- `forms/CustomerForm.jsx` — Validated customer form
- `forms/VehicleForm.jsx` — Dynamic car/bike fields
- `forms/MechanicForm.jsx` — Mechanic form with availability
- `forms/BillForm.jsx` — Dynamic items + live total calculation

#### API Services
| File | Methods |
|---|---|
| `api.js` | Axios instance, JWT interceptor, 401→redirect |
| `authService.js` | `login()` |
| `customerService.js` | `getAll, getById, create, update, delete, search` |
| `vehicleService.js` | `getAll, getById, create, update, delete, search, getByCustomer` |
| `mechanicService.js` | `getAll, create, update, delete` |
| `serviceService.js` | `getAll, getById, create, updateStatus, getByVehicle, getToday` |
| `billService.js` | `getAll, getById, getByServiceId, generate` |
| `searchService.js` | `search(query), searchParts(brand, model, year, part)` |
| `dashboardService.js` | `getStats(), globalSearch()` |

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Frontend** | React 18, Vite 5, Tailwind CSS 3, React Router v6 |
| **Charts** | Recharts |
| **Icons** | Lucide React |
| **HTTP Client** | Axios (frontend), OkHttp (backend SerpApi) |
| **Backend** | Spring Boot 3.2.3, Spring Security, Spring Data JPA |
| **Auth** | JWT (JJWT 0.12.6), BCrypt |
| **Database** | MySQL 8 with Hibernate ORM |
| **Build Tool** | Maven 3.9.16, Vite |
| **External API** | SerpApi (Google Search) |
| **Runtime** | Java 26 (compiled to Java 21 target), Node.js |

---

## 🔑 Configuration

### Backend `.env`
```env
DB_URL=jdbc:mysql://localhost:3306/garagepro?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true
DB_USERNAME=root
DB_PASSWORD=root
JWT_SECRET=garagepro_super_secret_jwt_key_2026_hackathon
SERPAPI_KEY=a76beda96496631e8f6b08840c3f8583cfb2042fb777f9813365d7393320d8c5
```

### Frontend `.env`
```env
VITE_API_URL=http://localhost:8080
```

---

## 🚀 How to Run

### Prerequisites
- Java 17+ (JDK 26 installed ✅)
- Node.js (installed ✅)
- Maven (installed at `C:\Users\Dilty\maven\apache-maven-3.9.16` ✅)
- **MySQL 8** — needs to be installed and running on port 3306

### Install MySQL (if not installed)
**Option A — XAMPP (easiest):** https://www.apachefriends.org/download.html  
→ Open XAMPP Control Panel → Click **Start** next to MySQL

**Option B — MySQL Community:** https://dev.mysql.com/downloads/installer/  
→ Set root password to `root` (or update `DB_PASSWORD` in `.env`)

**Option C — winget:**
```powershell
winget install Oracle.MySQL --accept-package-agreements
```

### Start Backend
```powershell
# Option 1 — Use the startup script (recommended)
Right-click start-backend.ps1 → "Run with PowerShell"

# Option 2 — Manual
cd c:\Users\Dilty\Desktop\car-garage\backend
java "-DSERPAPI_KEY=a76beda96496631e8f6b08840c3f8583cfb2042fb777f9813365d7393320d8c5" `
     "-DDB_URL=jdbc:mysql://localhost:3306/garagepro?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true" `
     "-DDB_USERNAME=root" "-DDB_PASSWORD=root" `
     "-DJWT_SECRET=garagepro_super_secret_jwt_key_2026_hackathon" `
     -jar target\garagepro-backend-0.0.1-SNAPSHOT.jar
```

Wait for: `Started GarageProApplication in X seconds`

### Start Frontend
```powershell
# Option 1 — Use the startup script
Right-click start-frontend.ps1 → "Run with PowerShell"

# Option 2 — Manual
cd c:\Users\Dilty\Desktop\car-garage\frontend
npm run dev
```

### Open in Browser
```
http://localhost:5173
```

| Field | Value |
|---|---|
| **Email** | admin@garagepro.com |
| **Password** | admin123 |

---

## 📊 Build Status

| Component | Status | Details |
|---|---|---|
| Backend compile | ✅ **PASS** | 65 Java files, 8.4 seconds |
| Backend JAR | ✅ **BUILT** | `garagepro-backend-0.0.1-SNAPSHOT.jar` |
| Frontend build | ✅ **PASS** | 2361 modules, 11.46 seconds |
| All pages | ✅ **REAL API** | No mock/fake data anywhere |
| Team section | ✅ **DONE** | 5 members on About page + sidebar |
| SerpApi key | ✅ **UPDATED** | New key in backend/.env |
| MySQL | ⚠️ **NEEDS INSTALL** | Not found on this machine |

---

## 🎯 Demo Script (for Hackathon)

1. **Login** → Show `admin@garagepro.com` / `admin123`
2. **Dashboard** → Explain stat cards (customers, vehicles, revenue), charts
3. **Customers** → Add a new customer live, search, edit, delete
4. **Vehicles** → Register a car, show CAR vs BIKE type (OOP demo)
5. **Book Service** → Select customer → vehicle auto-loads → fill form → show confirmation
6. **Services** → Show tabs, update a status live
7. **Billing** → Generate a bill with items, show GST calculation
8. **Bill Detail** → Show professional invoice, click Print
9. **Spare Parts Search** → Search "Hyundai i20 brake pads" → SerpApi live results
10. **Our Team** → Click sidebar "Our Team" → show all 5 members

---

*Built with ❤️ for Hackathon 2026*
