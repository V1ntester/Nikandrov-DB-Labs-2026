-- Created using PgAdmin 4
CREATE TABLE public."Orders"
(
    "IdOrder" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "IdCustomer" bigint NOT NULL,
    "OrderDate" timestamp(0) without time zone NOT NULL,
    "ShipDate" timestamp(0) without time zone,
    "PaidDate" timestamp(0) without time zone,
    "Status" character varying(1),
    CONSTRAINT "ForeignKeyOrdersCustomers" FOREIGN KEY ("IdCustomer")
        REFERENCES public."Customers" ("IdCustomer") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "CheckStatus" CHECK ("Status" IN ('C', 'A', 'P')) NOT VALID
);

ALTER TABLE IF EXISTS public."Orders"
    OWNER to postgres;
