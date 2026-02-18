CREATE TABLE public."Items"
(
    "IdItem" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "IdOrder" bigint NOT NULL,
    "IdProduct" bigint NOT NULL,
    "Quantity" int,
    "Total" numeric(10, 2),
    CONSTRAINT "ForeignKeyItemsOrders" FOREIGN KEY ("IdOrder")
        REFERENCES public."Orders" ("IdOrder") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "ForeignKeyItemsProducts" FOREIGN KEY ("IdProduct")
        REFERENCES public."Products" ("IdProduct") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
