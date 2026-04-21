## 🗄️ Database Schema

The database consists of five main tables that represent 
the core components of a supply chain.

---

## 🔗 Entity-Relationship (ER) Overview

customer ──(1:N)──> orders ──(1:N)──> order_item <──(1:N)── product <──(1:N)── supplier

| Relationship | Type | Description |
|---|---|---|
| Customer → Orders | 1:N | One customer can place many orders |
| Orders → OrderItem | 1:N | One order can contain multiple items |
| Product → OrderItem | 1:N | One product can appear in many order items |
| Supplier → Product | 1:N | One supplier can provide multiple products |

---

## 📋 Detailed Table Descriptions

### 1️⃣ Customer Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| `Id` | INT | Unique identifier (Primary Key) |
| `FirstName` | VARCHAR(40) | Customer's first name |
| `LastName` | VARCHAR(40) | Customer's last name |
| `City` | VARCHAR(40) | City where customer resides |
| `Country` | VARCHAR(40) | Country where customer resides |
| `Phone` | VARCHAR(20) | Contact phone number |

---

### 2️⃣ Orders Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| `Id` | INT | Unique identifier (Primary Key) |
| `OrderDate` | DATETIME | Date and time of order |
| `OrderNumber` | VARCHAR(10) | Unique order number for tracking |
| `CustomerId` | INT | Links to Customer table (Foreign Key) |
| `TotalAmount` | DECIMAL(12,2) | Total cost of the order |

---

### 3️⃣ OrderItem Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| `Id` | INT | Unique identifier (Primary Key) |
| `OrderId` | INT | Links to Orders table (Foreign Key) |
| `ProductId` | INT | Links to Product table (Foreign Key) |
| `UnitPrice` | DECIMAL(12,2) | Price per unit at time of order |
| `Quantity` | INT | Number of units ordered |

---

### 4️⃣ Product Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| `Id` | INT | Unique identifier (Primary Key) |
| `ProductName` | VARCHAR(50) | Name of the product |
| `SupplierId` | INT | Links to Supplier table (Foreign Key) |
| `UnitPrice` | DECIMAL(12,2) | Current price per unit |
| `Package` | VARCHAR(30) | Packaging details |
| `IsDiscontinued` | BIT(1) | 1 = Discontinued, 0 = Active |

---

### 5️⃣ Supplier Table
| Column | Data Type | Description |
|--------|-----------|-------------|
| `Id` | INT | Unique identifier (Primary Key) |
| `CompanyName` | VARCHAR(40) | Name of supplier company |
| `ContactName` | VARCHAR(50) | Primary contact person |
| `ContactTitle` | VARCHAR(40) | Title of contact person |
| `City` | VARCHAR(40) | City where supplier is located |
| `Country` | VARCHAR(40) | Country where supplier is located |
| `Phone` | VARCHAR(30) | Contact phone number |
| `Fax` | VARCHAR(30) | Fax number |

---

## 📊 Table Statistics

| Table | Records | Type |
|-------|---------|------|
| `customer` | 91 rows | Master |
| `orders` | 830 rows | Transaction |
| `order_item` | 2155 rows | Transaction |
| `product` | 78 rows | Master |
| `supplier` | 29 rows | Master |
