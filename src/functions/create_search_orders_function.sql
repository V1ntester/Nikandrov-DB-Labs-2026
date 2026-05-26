CREATE OR REPLACE FUNCTION search_orders_by_date(
    date_from timestamp DEFAULT NULL,
    date_to timestamp DEFAULT NULL,
    date_check timestamp DEFAULT NULL
)
RETURNS TABLE(
    "IdOrder" bigint,
    "IdCustomer" bigint,
    "OrderDate" timestamp,
    "ShipDate" timestamp,
    "PaidDate" timestamp,
    "Status" varchar
)
LANGUAGE SQL
AS $$
    SELECT "IdOrder", "IdCustomer", "OrderDate", "ShipDate", "PaidDate", "Status"
    FROM "Orders"
    WHERE (date_from IS NULL OR "OrderDate" >= date_from)
    AND (date_to IS NULL OR "OrderDate" <= date_to)
    OR ("OrderDate" = date_check)
    ORDER BY "OrderDate";
$$;
