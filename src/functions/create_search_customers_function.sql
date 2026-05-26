CREATE OR REPLACE FUNCTION search_customer_by_company(
    company_name_search varchar
)
RETURNS TABLE(
    "CompanyName" varchar,
    "LastName" varchar,
    "FirstName" varchar,
    "Address" varchar,
    "City" varchar,
    "IndexCode" varchar,
    "Phone" varchar,
    "E-Mail" varchar
)
LANGUAGE SQL
AS $$
    SELECT "CompanyName", "LastName", "FirstName", "Address", "City", "IndexCode", "Phone", "E-Mail"
    FROM "Customers"
    WHERE "CompanyName" ILIKE '%' || company_name_search || '%'
    ORDER BY "CompanyName";
$$;
