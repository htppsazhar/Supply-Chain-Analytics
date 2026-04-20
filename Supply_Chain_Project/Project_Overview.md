# 🔗 Supply Chain Management System

## 📌 Overview
A comprehensive Supply Chain Analytics project built using 
MySQL and Power BI. This project demonstrates how a 
relational database can be used to manage complex supply 
chain operations including customers, orders, products, 
and suppliers.

---

## 🎯 Project Objective
The primary goal is to build a robust MySQL database 
from scratch and analyze it using Power BI Dashboard.

### What you will learn:
- **Relational Schema Design** — How entities like 
  Customers and Suppliers relate to each other
- **DDL Implementation** — Create databases, tables, 
  and indexes
- **Constraints** — Primary Keys and Foreign Keys 
  to maintain data relationships
- **DML Operations** — Insert large datasets into tables
- **Advanced Querying** — SQL joins, aggregations, 
  and subqueries
- **BI Dashboard** — Power BI visualization of 
  supply chain data

---

## ❓ Why This Project?
In the real world, supply chain data is the backbone 
of retail and manufacturing. This project uses a 
realistic dataset that mimics actual business scenarios, 
providing practical experience directly applicable 
to the industry.

---

## 📂 Project Structure

Supply_Chain_Project/
├── data/
│   ├── customer.csv
│   ├── orders.csv
│   ├── order_item.csv
│   ├── product.csv
│   └── supplier.csv
├── sql/
│   └── supply_chain_database.sql
├── dashboard/
│   └── supply_chain_dashboard.pbix
└── README.md

---

## 🗺️ Project Steps

| Step | Description |
|------|-------------|
| **Step 1** | Overview — Understand the Why and What |
| **Step 2** | Dataset & Requirements — Data structure and business rules |
| **Step 3** | SQL Code — Build database in MySQL Workbench |
| **Step 4** | Practice Questions — Leveled challenges |
| **Step 5** | Solutions Guide — Best practices for queries |

---

## 🗄️ Database Schema

### Tables:
| Table | Description |
|-------|-------------|
| `customer` | Stores customer information |
| `orders` | Tracks all customer orders |
| `order_item` | Individual items within each order |
| `product` | Product catalog with pricing |
| `supplier` | Supplier information and location |

### Relationships:

customer ──── orders ──── order_item ──── product ──── supplier

---

## 📊 Power BI Dashboard

### 3 Dashboard Pages:

**Page 1 — Executive Overview**
- Total Revenue, Orders, Customers, Suppliers
- Monthly Order Trends
- Revenue by Country
- Top Customers Table
- Top Suppliers Chart
- Customer Distribution Map

**Page 2 — Demand Analysis**
- Total Products, Avg Order Value, Quantity Sold
- Top 10 Products by Revenue
- Order Trends by Year
- Product Demand Treemap
- Orders by Country
- Bulk Buyers Table

**Page 3 — Supplier Intelligence**
- Total Suppliers, Products Supplied, Avg Price
- Supplier Revenue Comparison
- Products per Supplier
- Supplier Distribution Map
- Premium Products Table
- Supplier Concentration Donut

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| MySQL Workbench | Database design and querying |
| Power BI Desktop | Data visualization and dashboard |
| GitHub | Version control and project sharing |

---

## 📈 Key Business Insights:

✅ Identified top revenue generating products
✅ Analyzed customer spending patterns by country
✅ Tracked monthly and yearly order trends
✅ Evaluated supplier performance and concentration
✅ Discovered bulk buying customers
✅ Mapped global customer and supplier distribution

---

## 👨‍💻 Author
**Azhar Ullah Khan**
- GitHub: (https://github.com/htppsazhar)

---

## 📃 License
This project is for educational purposes only.
