

WITH daily_orders AS
(
SELECT
  date_date,
  COUNT (DISTINCT orders_id) AS daily_transactions,
  ROUND (SUM (revenue), 0) AS daily_revenue,
  ROUND (SUM (margin), 0) AS daily_margin,
  ROUND (SUM (ops_margin), 0) AS daily_ops_margin,
  ROUND (SUM (purchase_cost), 0) AS daily_purchase_cost,
  ROUND (SUM (shipping_fee), 0) AS daily_shipping_fee,
  ROUND (SUM (log_cost), 0) AS daily_log_cost,
  ROUND (SUM (ship_cost), 0) AS daily_ship_cost,
  SUM (quantity) AS daily_quantity 
FROM {{ref("int_orders_ops")}}
GROUP BY date_date
)

SELECT
  date_date,
  daily_transactions,
  daily_revenue,
  ROUND (daily_revenue / daily_transactions, 2) AS avg_basket,
  daily_ops_margin,
  daily_orders.daily_purchase_cost,
  daily_orders.daily_shipping_fee,
  daily_orders.daily_log_cost,
  daily_orders.daily_quantity
FROM daily_orders
ORDER BY date_date DESC

