CREATE TABLE public."Products" 
(
    "IdProduct" bigserial,
    "PrName" character varying(255) NOT NULL,
    "PrPrice" numeric(10, 2),
    "InStock" int,
    "ReOrder" int, 
    "Description" text,
    PRIMARY KEY ("IdProduct")
);
