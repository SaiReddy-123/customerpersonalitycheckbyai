# 🚀 Customer Personality Analysis using SQL Server, Python ETL & Machine Learning

---

## 📌 Project Overview

This project focuses on **Customer Personality Analysis** and **AI-driven customer segmentation** using an end-to-end analytics pipeline built with:

* 🗄️ SQL Server
* 🐍 Python
* 🤖 Machine Learning

The primary objective of this project is to analyze customer behavior, spending habits, purchasing patterns, and campaign responses in order to identify meaningful customer segments for targeted marketing strategies.

Instead of marketing products to all customers equally, businesses can use customer segmentation to:

✅ Identify high-value customers
✅ Understand purchasing behavior
✅ Optimize marketing campaigns
✅ Improve customer retention
✅ Increase revenue

---

# 🧠 Business Problem

Companies often struggle with:

* Identifying valuable customers
* Understanding customer purchase behavior
* Improving campaign targeting
* Reducing unnecessary marketing costs

The goal of this project is to use **Machine Learning clustering techniques** to automatically group customers into meaningful segments based on:

* 💰 Income
* 🛒 Spending behavior
* 📈 Purchase frequency
* 🌐 Website activity
* 📢 Campaign engagement
* 👨‍👩‍👧 Family demographics

These customer segments can then be used for:

* Personalized marketing
* Loyalty programs
* Customer retention
* Product recommendation strategies

---

# 📂 Dataset Information

### Dataset Source

Customer Personality Analysis Dataset (Kaggle)

### Dataset Includes

* 👥 2237 customer records
* 🧾 Demographic information
* 💳 Spending behavior
* 📢 Campaign response history
* 🛍️ Purchase channel activity

---

# 🛠️ Technologies Used

## 🗄️ SQL Server

Used for:

* Staging tables
* ETL processing
* Data cleansing
* Feature engineering
* Analytics views

---

## 🐍 Python

Used for:

* Data extraction
* Data preprocessing
* Machine learning
* Clustering
* Visualization

### Python Libraries

```python
pandas
numpy
matplotlib
scikit-learn
sqlalchemy
pyodbc
joblib
```

---

# 🏗️ Project Architecture

```text
Kaggle CSV Dataset
        ↓
SQL Server Staging Table
        ↓
SQL Data Cleaning & ETL
        ↓
Feature Engineering
        ↓
Analytics View
        ↓
Python Data Processing
        ↓
Categorical Encoding
        ↓
Feature Scaling
        ↓
KMeans Clustering
        ↓
Customer Segment Generation
        ↓
Final Analytics Output
```

---

# ⚙️ ETL Process

## 📥 Step 1 — Raw Data Ingestion

The CSV dataset was loaded into SQL Server staging tables using:

* BULK INSERT
* Staging schema design
* Raw VARCHAR ingestion approach

### Why?

Raw datasets may contain:

* Invalid dates
* Malformed values
* Delimiter issues
* Encoding problems

---

## 🧹 Step 2 — Data Cleaning

Data types were standardized:

| Column Type    | Converted To |
| -------------- | ------------ |
| Income         | FLOAT        |
| Dates          | DATE         |
| Numeric Fields | INT          |

Missing and invalid records were handled using:

```sql
TRY_CAST()
TRY_CONVERT()
```

---

## 🧮 Step 3 — Feature Engineering

New analytical features were created:

| Feature                  | Description                 |
| ------------------------ | --------------------------- |
| Age                      | Current year - birth year   |
| Total_Children           | Kidhome + Teenhome          |
| Total_Spending           | Sum of all product spending |
| Total_Purchases          | Combined purchase channels  |
| Customer_Tenure_Days     | Days since enrollment       |
| Total_Campaigns_Accepted | Total accepted campaigns    |

These engineered features improved clustering quality and customer behavior analysis.

---

# 🤖 Machine Learning Workflow

## 📤 1. Data Extraction

Cleaned SQL Server data was loaded into Python using:

* SQLAlchemy
* pyodbc
* pandas

---

## 🩹 2. Missing Value Handling

Missing values were handled using:

```python
median imputation
```

### Why Median?

Median is less affected by outliers compared to average (mean).

---

## 🔤 3. Categorical Encoding

Machine Learning models cannot understand text directly.

Columns like:

* Education
* Marital_Status

were transformed using:

```python
One-Hot Encoding
```

### Example

| Education  | Encoded Feature          |
| ---------- | ------------------------ |
| Graduation | Education_Graduation = 1 |

---

## 📏 4. Feature Scaling

Features like:

* Income
* Spending
* Purchases

exist on completely different numeric scales.

### Problem

Without scaling:

* Income dominates clustering calculations
* Smaller features become less important

### Solution

Applied:

```python
StandardScaler()
```

### Scaling Formula

```text
z = (x - mean) / standard deviation
```

### Outcome

All features contribute fairly during clustering.

---

## 📉 5. Elbow Method

The Elbow Method was used to identify the optimal number of clusters.

### Observation

```text
K = 4
```

provided the best balance between:

* Clustering quality
* Business interpretability

---

## 🧠 6. KMeans Clustering

KMeans algorithm grouped customers into:

```text
4 Customer Segments
```

based on:

* Spending behavior
* Purchase activity
* Income
* Customer engagement

Each customer was assigned:

* Cluster ID
* Segment Name

---

# 👥 Customer Segments Identified

## 💎 VIP Customers

### Characteristics

* Highest income
* Highest spending
* Strong purchase frequency
* High catalog purchases

### Business Strategy

* Premium offers
* Loyalty rewards
* Personalized campaigns

---

## 🤝 Loyal Customers

### Characteristics

* Stable spending
* Frequent purchases
* Consistent engagement

### Business Strategy

* Retention campaigns
* Membership programs
* Cross-selling

---

## 💸 Budget Customers

### Characteristics

* Lower income
* Lower spending
* Discount-oriented behavior

### Business Strategy

* Coupons
* Discounts
* Promotional offers

---

## 😴 Inactive Customers

### Characteristics

* Low engagement
* Low spending
* Small customer segment

### Business Strategy

* Re-engagement campaigns
* Win-back offers

---

# 📊 Data Visualizations Created

Visualizations generated using Python:

✅ Bar Charts
✅ Pie Charts
✅ Histograms
✅ Customer Segment Distribution
✅ Spending Analysis by Segment
✅ Income Analysis by Segment

---

# 📚 Key Concepts Demonstrated

## 🏗️ Data Engineering

* ETL pipelines
* Staging tables
* SQL transformations
* Feature engineering

---

## 📈 Data Analysis

* Statistical analysis
* Missing value handling
* Business interpretation

---

## 🤖 Machine Learning

* Unsupervised learning
* KMeans clustering
* Feature scaling
* Categorical encoding
* Customer segmentation

---

# 💼 Business Impact

This project demonstrates how businesses can:

✅ Optimize marketing spend
✅ Personalize customer engagement
✅ Identify high-value customers
✅ Improve campaign targeting
✅ Increase customer retention

---

# 🔮 Future Enhancements

Potential future improvements:

* PCA cluster visualization
* Recommendation systems
* Predictive campaign response models
* Automated ETL scheduling
* Cloud deployment (AWS / Azure)
* Real-time customer segmentation APIs

---

# 🎯 Final Outcome

Successfully built an end-to-end Customer Personality Analysis solution integrating:

* SQL Server ETL
* Python preprocessing
* Machine Learning clustering

This project demonstrates practical enterprise-level skills in:

✅ Data Engineering
✅ Analytics
✅ Machine Learning
✅ Customer Segmentation

---

# ⭐ Key Takeaways

This project showcases how modern businesses can combine:

* Data Engineering
* Machine Learning
* Customer Analytics

to create actionable business intelligence and personalized customer experiences.

---

# 👨‍💻 Author

Sai Reddy

---

# 📌 Project Status

✅ Completed
🚀 Portfolio Ready
📊 Enterprise-Style Analytics Workflow
