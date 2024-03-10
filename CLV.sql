CREATE TABLE IF NOT EXISTS customer_acquisition_data (
    customer_id INTEGER PRIMARY KEY,
    channel TEXT,
    cost REAL,
    conversion_rate REAL,
    revenue REAL
);

SELECT * FROM customer_acquisition_data LIMIT 5;


SELECT
    COUNT(*) AS total_customers,
    AVG(cost) AS avg_cost,
    AVG(conversion_rate) AS avg_conversion_rate,
    AVG(revenue) AS avg_revenue
FROM customer_acquisition_data;

SELECT
    customer_id,
    channel,
    ((revenue - cost) * conversion_rate) / cost AS clv
FROM
    customer_acquisition_data;
	

UPDATE customer_acquisition_data
SET roi = ((revenue - cost) / cost) * 100;

SELECT * FROM customer_acquisition_data;



UPDATE customer_acquisition_data
SET clv = ((revenue - cost) * conversion_rate) / cost;

SELECT
    customer_id,
    channel,
	roi,
    clv,
    CASE
        WHEN clv >= 80 THEN 'High Value'
        WHEN clv >= 50 AND clv < 100 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS clv_segment
FROM
    customer_acquisition_data;
	




