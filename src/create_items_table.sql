CREATE TABLE public."Items"
(
    "IdItem" bigserial,
    "IdOrder" bigint NOT NULL,
    "IdProduct" bigint NOT NULL,
    "Quantity" int,
    "Total" numeric(10, 2),
    PRIMARY KEY ("IdItem"),
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
