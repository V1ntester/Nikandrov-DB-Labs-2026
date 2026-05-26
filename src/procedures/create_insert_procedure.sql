CREATE OR REPLACE PROCEDURE insert_customer(
    company_name varchar,
    last_name varchar,
    first_name varchar,
    address varchar,
    city varchar,
    index_code varchar,
    phone varchar,
    email varchar
)
LANGUAGE SQL
AS $$
    INSERT INTO "Customers" ("CompanyName", "LastName", "FirstName", "Address", "City", "IndexCode", "Phone", "E-Mail")
    VALUES (company_name, last_name, first_name, address, city, index_code, phone, email);
$$;
