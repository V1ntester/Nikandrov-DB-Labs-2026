CREATE OR REPLACE FUNCTION update_item_total()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE "Items" 
    SET "Total" = (SELECT "PrPrice" FROM "Products" WHERE "IdProduct" = NEW."IdProduct") * NEW."Quantity"
    WHERE "IdItem" = NEW."IdItem";
END;
$$;

CREATE TRIGGER trg_items_update_total
AFTER UPDATE OF "Quantity" ON "Items"
FOR EACH ROW
EXECUTE FUNCTION update_item_total();
