# 🛒 Web Scraping & ETL Data Pipeline — Hacktiv8 Milestone 1

This project showcases an end-to-end **ETL (Extract – Transform – Load)** pipeline built from scratch using **Python, SQL, and PostgreSQL**. The goal is to scrape e-commerce product data, clean and transform it, and load it into a **3NF-normalized relational database**.

This project was completed as part of **Hacktiv8 CODA – Milestone 1**.

---

## 📌 Project Summary

In this project, I:

### **🔍 Extract**

* Scraped e-commerce product information using **Selenium** and **BeautifulSoup4**
* Collected key data fields:

  * Store name
  * Product name
  * Product price
  * Total reviews
  * Number of available sizes

### **🧹 Transform**

* Cleaned and standardized raw data using **Pandas**, including:

  * Removing duplicates
  * Fixing inconsistent values
  * Ensuring numeric columns are correctly typed
  * Normalizing text formats

### **🗄 Load**

* Loaded the cleaned data into **PostgreSQL**
* Designed and implemented:

  * A **staging table** for raw data
  * Final **3NF schema** (`toko` and `produk`)
  * **Foreign key** relationships
* Inserted unique stores and joined them to product records in a relational structure

---

## 📁 Project Structure

```
├── coda_P0M1_aniszou.ipynb      # Web scraping, data cleaning, transformation
├── coda_P0M1_aniszou_raw.csv    # Raw scraped data
├── coda_P0M1_aniszou.csv        # Cleaned processed data
├── coda_P0M1_aniszou.sql        # SQL script for database, staging, 3NF schema
└── README.md                    # Project documentation
```

---

## 🗄️ Database Schema (ERD)


### **staging** (Temporary Raw Storage)

| Column        | Type    |
| ------------- | ------- |
| id            | serial  |
| nama_toko     | text    |
| nama_produk   | text    |
| harga_produk  | integer |
| jumlah_review | integer |
| banyak_ukuran | integer |

---

### **toko** (Store Table)

Stores unique store names to eliminate redundancy.

| Column    | Type   |
| --------- | ------ |
| id        | serial |
| nama_toko | text   |

---

### **produk** (Product Table)

Final clean product data linked to store by **foreign key**.

| Column        | Type                   |
| ------------- | ---------------------- |
| id            | serial                 |
| nama_produk   | text                   |
| harga_produk  | integer                |
| jumlah_review | integer                |
| banyak_ukuran | integer                |
| toko_id       | integer (FK → toko.id) |

---

## 🛠 Technologies Used

### **Languages**

* Python
* SQL

### **Python Libraries**

* Selenium
* BeautifulSoup4
* Pandas
* Jupyter Notebook

### **Database**

* PostgreSQL

---

## 🎯 Key Learning Outcomes

Through this project, I learned to:

* Build a full **ETL pipeline** from scratch
* Scrape real-world web data using **Selenium + BeautifulSoup4**
* Perform data cleaning and transformation using **Pandas**
* Design and normalize relational databases (up to **3NF**)
* Implement **foreign keys, constraints, and relational joins**
* Structure raw → cleaned → normalized data using staging & relational tables
* Integrate Python and SQL workflows into one pipeline
* Develop production-like data ingestion logic

---
