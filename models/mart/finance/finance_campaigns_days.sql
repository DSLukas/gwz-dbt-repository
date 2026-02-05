SELECT
    date_date,
    (daily_ops_margin - ads_cost) AS ads_margin,
    ROUND (avg_basket, 2) AS avg_basket,
    daily_ops_margin,
    ads_cost,
    ads_impression,
    ads_clicks,
    daily_quantity,
    daily_revenue
 FROM {{ ref('int_campaigns_days') }}
 FULL OUTER JOIN {{ ref('finance_days') }}
     USING (date_date)
 ORDER BY date_date DESC