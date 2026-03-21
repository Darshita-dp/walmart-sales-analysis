# 🛒 Walmart Retail Sales Analysis (SQL + Python)

## 📌 Project Overview

This project analyzes Walmart retail sales data to understand revenue trends, customer behavior, and branch-level performance.

The data was cleaned and processed using Python, stored in PostgreSQL, and analyzed using SQL to answer business-focused questions. The goal of this project is to demonstrate how raw data can be transformed into meaningful insights for decision-making.

---

## 📊 Dataset

- Source: Walmart Sales Dataset from Kaggle  
- Contains ~10,000 transactions  
- Includes features such as branch, city, category, unit price, quantity, payment method, rating, and sales data  

---

## 🧰 Tools & Technologies

- Python (Pandas)
- PostgreSQL
- SQL (Window Functions, CTEs, Aggregations)
- SQLAlchemy
- VS Code

---

## 🔄 Data Pipeline

1. Data downloaded from Kaggle  
2. Cleaned using Python (handling nulls, duplicates, data types)  
3. Feature engineering (created total sales column)  
4. Loaded into PostgreSQL using SQLAlchemy  
5. SQL queries used for analysis and business insights  

---

## ❓ Key Business Questions

- Which branches generate the highest revenue?  
- What are the most commonly used payment methods?  
- Which product categories are most profitable?  
- What are the busiest sales periods?  
- Which branches show declining performance over time?  
- How does customer rating vary across branches and categories?  

---

## 📊 Key Insights

- Branch C generated the highest revenue, indicating strong overall sales performance compared to other branches.  
- Cash was the most frequently used payment method, showing customer preference for direct transactions.  
- Certain product categories contributed significantly higher profit, making them key drivers of business value.  
- Afternoon time periods showed the highest number of transactions, indicating peak customer activity.  
- Some branches experienced a decline in revenue from 2022 to 2023, suggesting possible operational or demand-related issues.  
- Customer ratings were generally consistent, but slight variations across categories may indicate differences in product satisfaction.  

---

## 🚀 Business Interpretation

- High-performing branches can be used as benchmarks to improve operations in lower-performing locations.  
- Categories with higher profit contribution should be prioritized in inventory planning and marketing strategies.  
- Revenue decline in certain branches should be investigated further to identify root causes such as pricing, demand shifts, or customer experience issues.  

---

## 📁 Project Structure

```
|-- data/  
│   ├── walmart_raw.csv  
│   └── walmart_clean.csv  

|-- notebooks/  
│   └── walmart_analysis.ipynb  

|-- sql/  
│   └── walmart_queries.sql  

|-- README.md  
|-- requirements.txt  
```

---

## ⚙️ How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/Darshita-dp/walmart-sales-analysis.git
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Set up PostgreSQL database:
   - Create a database (e.g., `walmart_db`)

4. Run Python notebook:
   - Clean data  
   - Load into PostgreSQL  

5. Run SQL queries from the `sql/` folder  

---

## 🔮 Future Improvements

- Build a Power BI or Tableau dashboard for visualization  
- Add more advanced analysis (customer segmentation, time-series trends)  
- Automate the data pipeline for real-time updates  

---

## 📚 Data Source

- Walmart Sales Dataset from Kaggle  

---

## 🙌 Final Note

This project reflects my ability to work with real-world datasets, clean and process data, and extract meaningful insights using SQL and Python.