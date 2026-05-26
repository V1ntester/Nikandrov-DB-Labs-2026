CREATE OR REPLACE FUNCTION set_order_date()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE "Orders" 
    SET "OrderDate" = CURRENT_TIMESTAMP 
    WHERE "IdOrder" = NEW."IdOrder";
    RETURN OLD;
END;
$$;

CREATE TRIGGER trg_orders_set_date
AFTER INSERT ON "Orders"
FOR EACH ROW
EXECUTE FUNCTION set_order_date();
