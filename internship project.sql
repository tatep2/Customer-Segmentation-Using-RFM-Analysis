select * from online limit 10

CREATE VIEW single_customer_view AS
SELECT 
    "onli",

    COUNT(DISTINCT "InvoiceNo") AS total_orders,

    SUM("Quantity") AS total_items,

    SUM("Quantity" * "UnitPrice") AS total_revenue,

    MIN("InvoiceDate") AS first_purchase_date,

    MAX("InvoiceDate") AS last_purchase_date,

    CURRENT_DATE - DATE(MAX("InvoiceDate")) AS recency_days,

    COUNT(DISTINCT "InvoiceNo") AS frequency,

    SUM("Quantity" * "UnitPrice") AS monetary_value

FROM online

WHERE "CustomerID" IS NOT NULL

GROUP BY "CustomerID";


CREATE VIEW customer_lifetime_value_view AS 

SELECT
"Customer ID",

count(DISTINCT "Invoice") AS total_orders,

sum("Quantity" * "Price") AS total_revenue,

sum("Quantity" * "Price")/
COUNT(DISTINCT "Invoice") AS avg_order_value,

sum("Quantity" * "Price") AS customer_lifetime_value

FROM online


WHERE "Customer ID" IS NOT NULL

GROUP BY "Customer ID";

SELECT * FROM customer_lifetime_value_view;
