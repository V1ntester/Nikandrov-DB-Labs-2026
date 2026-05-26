CREATE OR REPLACE FUNCTION get_products_in_two_orders(
    first_order_id bigint,
    second_order_id bigint
)
RETURNS TABLE(
    "IdProduct" bigint,
    "PrName" varchar,
    "Quantity" integer,
    "Total" numeric,
    "OrderDate" timestamp,
    "OrderId" bigint
)
LANGUAGE SQL
AS $$
    SELECT 
        i."IdProduct",
        p."PrName",
        i."Quantity",
        i."Total",
        o."OrderDate",
        o."IdOrder"
    FROM "Items" i
    JOIN "Products" p ON i."IdProduct" = p."IdProduct"
    JOIN "Orders" o ON i."IdOrder" = o."IdOrder"
    WHERE i."IdOrder" IN (first_order_id, second_order_id)
    ORDER BY o."IdOrder", i."IdProduct";
$$;
