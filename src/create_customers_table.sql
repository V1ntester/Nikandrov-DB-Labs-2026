-- Created using PgAdmin 4
CREATE TABLE public."Customers"
(
    "IdCustomer" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "CompanyName" character varying(255),
    "LastName" character varying(100) NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "Address" character varying(255),
    "City" character varying(100),
    "IndexCode" character varying(10),
    "Phone" character varying(20),
    "E-Mail" character varying(255),
    CONSTRAINT "UniqueName" UNIQUE ("LastName", "FirstName")
);

ALTER TABLE IF EXISTS public."Customers"
    OWNER to postgres;
