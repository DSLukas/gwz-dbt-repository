SELECT
    om.orders_id,
    om.date_date,
    ROUND (om.margin + ship.shipping_fee - (ship.logcost + ship.ship_cost), 2) AS ops_margin,
    om.quantity,
    om.revenue,
    om.margin,
    ship.shipping_fee,
    ship.ship_cost,
    ship.logcost AS log_cost
FROM {{ref("int_orders_margin")}} AS om
LEFT JOIN {{ref("stg_raw_data__ship")}} AS ship
    USING (orders_id)
ORDER BY orders_id DESC