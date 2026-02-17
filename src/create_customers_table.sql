CREATE TABLE public."Customers"
(
    "IdCustomer" bigserial,
    "CompanyName" character varying(255),
    "LastName" character varying(100) NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "Address" character varying(255),
    "City" character varying(100),
    "IndexCode" character varying(10),
    "Phone" character varying(20),
    "E-Mail" character varying(255),
    PRIMARY KEY ("IdCustomer"),
    CONSTRAINT "UniqueLastName" UNIQUE ("LastName")
    CONSTRAINT "UniqueFirstName" UNIQUE ("FirstName")
);

ALTER TABLE IF EXISTS public."Customers"
    OWNER to postgres;
