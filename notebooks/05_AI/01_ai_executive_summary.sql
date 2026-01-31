CREATE OR REPLACE TABLE olist_ecommerce.gold.ai_executive_summary AS
SELECT
  /* ===================== ORDERS ===================== */
  (
    SELECT
      COUNT(DISTINCT order_id)
    FROM
      olist_ecommerce.gold.fact_orders
  ) AS total_orders,
  (
    SELECT
      SUM(order_value)
    FROM
      olist_ecommerce.gold.fact_orders
  ) AS total_revenue,
  (
    SELECT
      AVG(order_value)
    FROM
      olist_ecommerce.gold.fact_orders
  ) AS avg_order_value,
  /* ===================== SALES ===================== */
  (
    SELECT
      COUNT(*)
    FROM
      olist_ecommerce.gold.fact_sales
  ) AS total_items_sold,
  (
    SELECT
      AVG(price)
    FROM
      olist_ecommerce.gold.fact_sales
  ) AS avg_item_price,
  /* ===================== RFM ===================== */
  (
    SELECT
      COUNT(DISTINCT customer_unique_id)
    FROM
      olist_ecommerce.gold.customer_rfm_segments
  ) AS total_customers,
  (
    SELECT
      AVG(
        CASE
          WHEN customer_segment = 'High Value' THEN 1
          ELSE 0
        END
      )
      * 100
    FROM
      olist_ecommerce.gold.customer_rfm_segments
  ) AS high_value_customers_pct,
  /* ===================== DELIVERY ===================== */
  (
    SELECT
      AVG(is_late_delivery)
    FROM
      olist_ecommerce.gold.delivery_predictions
  ) AS late_delivery_rate,
  /* ===================== SENTIMENT ===================== */
  (
    SELECT
      AVG(
        CASE
          WHEN sentiment = 'positive' THEN 1
          ELSE 0
        END
      )
      * 100
    FROM
      olist_ecommerce.gold.review_sentiment
  ) AS positive_review_pct,
  (
    SELECT
      AVG(review_score)
    FROM
      olist_ecommerce.gold.review_sentiment
  ) AS avg_sentiment_score;