CREATE OR REPLACE FUNCTION get_products_sold_in_all_cities_strict()
RETURNS TABLE(
    "IdProduct" bigint,
    "PrName" varchar
)
LANGUAGE SQL
AS $$
    SELECT 
        i."IdProduct",
        p."PrName"
    FROM "Items" i
    JOIN "Orders" o ON i."IdOrder" = o."IdOrder"
    JOIN "Customers" c ON o."IdCustomer" = c."IdCustomer"
    JOIN "Products" p ON i."IdProduct" = p."IdProduct"
    GROUP BY i."IdProduct", p."PrName"
    HAVING COUNT(DISTINCT c."City") = (
        SELECT COUNT(DISTINCT "City") 
        FROM "Customers" 
        WHERE "City" IS NOT NULL
    )
    ORDER BY i."IdProduct";
$$;
