CREATE OR REPLACE PROCEDURE update_customer_email (
    id bigint,
    email varchar
)
LANGUAGE SQL
AS $$
UPDATE "Customers" 
SET "E-Mail" = email
WHERE "IdCustomer" = id;
$$;
