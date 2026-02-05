SELECT
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    ROUND (sales.quantity * product.purchase_price, 2) AS purchase_cost,
    ROUND (sales.revenue - sales.quantity * product.purchase_price, 2) AS margin
FROM {{ref("stg_raw_data__sales")}} AS sales
LEFT JOIN {{ref("stg_raw_data__product")}} AS product
    USING (products_id)