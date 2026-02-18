CREATE TABLE public."Products" 
(
    "IdProduct" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "PrName" character varying(255) NOT NULL,
    "PrPrice" numeric(10, 2),
    "InStock" int,
    "ReOrder" int, 
    "Description" text,
);
