CREATE OR REPLACE FUNCTION search_products_by_price(
    min_price numeric,
    max_price numeric
)
RETURNS TABLE(
    "IdProduct" bigint,
    "PrName" varchar,
    "PrPrice" numeric,
    "InStock" integer,
    "ReOrder" integer,
    "Description" text
)
LANGUAGE SQL
AS $$
    SELECT "IdProduct", "PrName", "PrPrice", "InStock", "ReOrder", "Description"
    FROM "Products"
    WHERE "PrPrice" BETWEEN min_price AND max_price
    ORDER BY "PrPrice";
$$;
