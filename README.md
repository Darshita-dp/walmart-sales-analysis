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

- **Credit Card** was the most used payment method with **4,260 transactions**, followed by E-wallet (3,911) and Cash (1,880), indicating strong preference for digital payments.

- **Electronic Accessories** and **Food & Beverages** frequently appeared as top-rated categories across branches, with some categories reaching average ratings as high as **9.3**, showing strong customer satisfaction in these segments.

- Sales activity was **highest during Afternoon hours**, consistently showing more transactions compared to Morning and Evening across multiple branches.

- **Home and Lifestyle** generated the highest total revenue (**~49,196**) and highest profit (**~19,325**), making it the most valuable category for the business.

- Revenue distribution across branches shows a **top branch generating ~25,732 in revenue**, highlighting performance gaps between high and low-performing branches.

- **E-wallet** emerged as the most preferred payment method across the majority of branches, even when credit card had higher total volume overall.

- Average transaction value varied across branches, with the top branch reaching **~182.73 per transaction**, indicating differences in customer spending behavior. 

---

## 🚀 Business Interpretation

- The strong usage of credit cards and e-wallets suggests that Walmart should continue investing in seamless digital payment infrastructure and promotions tied to these methods.

- High-performing categories like **Home and Lifestyle** should be prioritized in inventory planning, pricing strategy, and marketing campaigns to maximize profitability.

- Afternoon peak sales indicate an opportunity to optimize staffing, promotions, and operational efficiency during high-demand hours.

- Variation in branch-level revenue and transaction value highlights the need to analyze underperforming branches and replicate strategies from top-performing locations.

- Consistently high ratings in specific categories suggest strong product-market fit, which can be leveraged for upselling and cross-selling strategies. 

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