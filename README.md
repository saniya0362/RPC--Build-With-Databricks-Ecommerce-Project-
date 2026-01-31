# End-to-End E-Commerce Analytics & AI Platform on Databricks

This is an end-to-end Databricks Lakehouse project that implements a
Bronze–Silver–Gold Medallion architecture, machine learning models
(RFM Segmentation, Delivery Delay Prediction, Sentiment Analysis),
and an AI-powered executive business summary using Mosaic AI and SQL.

---

## Problem Statement

E-commerce businesses generate large volumes of transactional, operational,
and customer feedback data. However, converting this data into actionable
business insights is difficult due to:

- Raw, unstructured, and duplicated data
- Poor visibility into customer value and retention
- Late deliveries impacting customer satisfaction
- Unstructured review text that is hard to analyze at scale
- Insights that are difficult to communicate to leadership

This project addresses these challenges by building a
production-ready analytics, machine learning, and AI platform
using Databricks.

---

## Architecture Overview

The solution follows the Databricks Medallion Architecture with 
Machine Learning and Generative AI layers built on top:
    
  **Bronze → Silver → Gold → ML → AI Insights** 
    
- Bronze: Raw CSV ingestion (schema enforced, audit columns)
- Silver: Cleaned, standardized, deduplicated data
- Gold: Business-ready fact & dimension tables
- ML Layer: RFM segmentation, delivery prediction, sentiment analysis
- AI Layer: Executive AI Summary using Mosaic AI

(Unity Catalog is used for governance across all layers.)

![Architecture](architectur/architecture.png)

---

## Data Modeling (Gold Layer)

The Gold layer contains analytics-ready fact and dimension tables
designed for reporting, ML feature engineering, and AI summarization.

**Fact Tables**
- `fact_orders` – Order-level metrics (revenue, delivery status, payments)
- `fact_sales` – Order item–level sales data

**Dimension Tables**
- `dim_customers`
- `dim_products`
- `dim_sellers`
- `dim_date`

This star-schema design enables scalable analytics and
reusable ML features.

---

## Machine Learning & AI

### RFM Segmentation (Unsupervised)
- Customer Recency, Frequency, and Monetary features
- KMeans clustering
- Identifies high-value and at-risk customers
- Output stored in the Gold layer

### Delivery Prediction (Supervised)
- Binary classification: late vs on-time delivery
- Models evaluated:
  - Logistic Regression
  - Random Forest
  - Decision Tree
- Evaluated using AUC and F1 score
- Best model selected and tracked using MLflow

### Sentiment Analysis (NLP)
- Portuguese customer reviews
- LLM-based sentiment scoring using Mosaic AI
- Converts unstructured text into numeric business signals

---

## AI Summary Genie (Executive Insights)

A Generative AI layer built using Mosaic AI SQL functions that:

- Aggregates KPIs from:
  - Orders
  - Sales
  - Delivery prediction
  - RFM segmentation
  - Review sentiment

- Produces executive-ready summaries, including:
  - Business health
  - Revenue drivers
  - Delivery risks
  - Customer sentiment
  - Actionable recommendations

This allows business leaders to consume insights directly from data,
without relying on traditional dashboards.

---

## Key Business Insights

- Revenue is driven by order volume rather than high-value repeat customers
- Late deliveries (~8%) significantly impact customer sentiment
- Basket size is low (~1.14 items/order), indicating upsell opportunities
- Customer sentiment is moderate, with delivery issues as a key driver

---

## Future Enhancements

- Real-time streaming ingestion
- Feature Store integration
- Model serving endpoints
- BI dashboards (Power BI / Databricks SQL)

---

## Tech Stack

- Databricks (Unity Catalog, Delta Lake)
-  Databricks SQL Warehouses
- PySpark & Spark SQL
- MLflow
- Mosaic AI
- Python (ML & NLP)

---

## Repository Structure

- `notebooks/bronze` – Raw data ingestion and schema enforcement
- `notebooks/silver` – Data cleaning, standardization, deduplication
- `notebooks/gold` – Fact & dimension tables, summary tables
- `notebooks/ML` – RFM segmentation, delivery prediction models
- `notebooks/AI_Summaries` – Mosaic AI SQL prompts and summaries
- `presentation/Databricks_AI_Project_Presentation.pdf` – Final presentation
  
---

## Presentation

You can view the presentation [here](https://youtu.be/).

---

## Challenge Context

This project was developed as part of the **14 Days Databricks AI Challenge**, organized by **Codebasics**, **Indian Data Club**, and **Databricks**.

