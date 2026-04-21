# 🗄️ SQL File 01 — Database Setup & Table Creation

## 📌 Overview
This file contains all the SQL code required to:
- Create the Supply Chain database
- Create all 5 tables with proper constraints
- Insert data into all tables

---

## 📂 File Name
`supply_chain_sql_database_01.sql`

---

## 🛠️ What this file does:

### Step 1️⃣ — Database Creation
```sql
CREATE DATABASE supply_chain;
USE supply_chain;
```

### Step 2️⃣ — Table Creation
Creates the following 5 tables in order:

| Order | Table | Reason |
|-------|-------|--------|
| 1st | `supplier` | No dependencies |
| 2nd | `customer` | No dependencies |
| 3rd | `product` | Depends on supplier |
| 4th | `orders` | Depends on customer |
| 5th | `order_item` | Depends on orders & product |

> ⚠️ **Important** — Tables must be created in this 
> exact order because of Foreign Key dependencies!

### Step 3️⃣ — Constraints Applied
| Constraint | Used In | Purpose |
|------------|---------|---------|
| PRIMARY KEY | All tables | Unique identifier |
| FOREIGN KEY | orders, product, order_item | Table relationships |
| NOT NULL | Key columns | Data integrity |
| DECIMAL(12,2) | Price columns | Accurate pricing |

### Step 4️⃣ — Data Insertion
Inserts records into all 5 tables:

| Table | Records Inserted |
|-------|-----------------|
| `supplier` | 29 rows |
| `customer` | 91 rows |
| `product` | 78 rows |
| `orders` | 830 rows |
| `order_item` | 2155 rows |

---

## ▶️ How to Run:
1. Open **MySQL Workbench**
2. Open `supply_chain_sql_database_01.sql`
3. Press **Ctrl + A** to select all
4. Press **Ctrl + Enter** to execute
5. Refresh schemas → `supply_chain` database appears ✅

---

## ✅ Expected Output:
```
supply_chain database created
5 tables created successfully
3183 total records inserted
```
