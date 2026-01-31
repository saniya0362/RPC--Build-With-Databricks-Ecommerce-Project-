SELECT
  ai_query(
    'databricks-gpt-5-2',
    CONCAT(
      'You are a senior business analyst preparing insights for leadership. ',
      'Analyze the following ecommerce KPIs and produce:\n',
      '1. Overall business health summary\n',
      '2. Revenue and customer insights\n',
      '3. Delivery performance risks\n',
      '4. Customer sentiment interpretation\n',
      '5. 2-3 actionable recommendations\n\n',
      'Metrics:\n',
      'Total Orders: ', total_orders, '\n',
      'Total Revenue: ', total_revenue, '\n',
      'Average Order Value: ', avg_order_value, '\n',
      'Total Items Sold: ', total_items_sold, '\n',
      'High Value Customer %: ', high_value_customers_pct, '\n',
      'Late Delivery Rate: ', late_delivery_rate, '\n',
      'Positive Review %: ', positive_review_pct, '\n',
      'Average Sentiment Score: ', avg_sentiment_score
    )
  ) AS executive_ai_summary
FROM olist_ecommerce.gold.ai_executive_summary;