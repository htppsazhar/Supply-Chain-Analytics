# 📊 SQL File 02 — Business Questions & Solutions

## 📌 Overview
This file contains all SQL queries written to answer 
real world business questions asked by the client 
across 3 difficulty levels.

---

## 📂 File Name
`supply_chain_sql_database_02.sql`

---

## 📋 Query Sections:

---

## 🟢 Section A — Level 1 (Basic Queries)

| # | Question | Concepts Used |
|---|----------|--------------|
| 1 | Data Exploration — Read all tables | SELECT * |
| 2 | Small Orders — Quantity = 1 | WHERE |
| 3 | Active Inventory — Not discontinued | WHERE, Boolean |
| 4 | Supplier Catalog — Company & products | JOIN |
| 5 | Customer Ranking — By total amount | ORDER BY |
| 6 | Find count of customers per country | GROUP BY, COUNT |
| 7 | Top Suppliers — Highest products | GROUP BY, COUNT |
| 8 | Order Trends — Count per month/year | YEAR(), MONTH() |
| 9 | Supplier Concentration — Max suppliers | GROUP BY, LIMIT |
| 10 | Inactive Customers — Never ordered | LEFT JOIN, IS NULL |

---

## 🟡 Section B — Level 2 (Intermediate Queries)

| # | Question | Concepts Used |
|---|----------|--------------|
| 1 | High Value Items — Most expensive per customer | JOIN, MAX |
| 2 | Product Demand — Rank by quantity | JOIN, SUM, ORDER BY |
| 3 | Premium Suppliers — Price above 100 | JOIN, WHERE |
| 4 | City Based Networking — Same city customers | GROUP BY, GROUP_CONCAT |
| 5 | Top Spender — Highest spending customer | JOIN, SUM, LIMIT |
| 6 | Customer Loyalty — Latest order excluding first | HAVING, COUNT |
| 7 | Supplier Revenue — Top 3 by revenue | JOIN, SUM, LIMIT |
| 8 | Order Details — Order, product, supplier | Multi-table JOIN |
| 9 | Bulk Buyers — More than 10 products | HAVING, COUNT |
| 10 | Order History — Current & previous dates | LAG(), OVER() |

---

## 🔴 Section C — Level 3 (Advanced Queries)

| # | Question | Concepts Used |
|---|----------|--------------|
| 1 | Revenue Analysis | Window Functions |
| 2 | Customer Segmentation | CASE, GROUP BY |
| 3 | Supply Chain Efficiency | Complex JOINs |
| 4 | Year over Year Growth | YEAR(), Subquery |
| 5 | Product Performance Index | Multiple Aggregations |

---

## 💡 Key SQL Concepts Covered:
