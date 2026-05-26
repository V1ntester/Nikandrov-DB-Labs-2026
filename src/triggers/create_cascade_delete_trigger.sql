CREATE OR REPLACE FUNCTION cascade_delete_product()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM "Items" WHERE "IdProduct" = OLD."IdProduct";
    RETURN OLD;
END;
$$;

CREATE TRIGGER trg_products_cascade_delete
BEFORE DELETE ON "Products"
FOR EACH ROW
EXECUTE FUNCTION cascade_delete_product();
