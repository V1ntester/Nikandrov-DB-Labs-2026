CREATE OR REPLACE FUNCTION delete_customer()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM "Orders" WHERE "IdCustomer" = OLD."IdCustomer") THEN
        RAISE EXCEPTION 'Cannot delete customer % because they have orders', OLD."IdCustomer";
    END IF;
    
    RETURN OLD;
END;
$$;

CREATE TRIGGER trg_delete_customer
BEFORE DELETE ON "Customers"
FOR EACH ROW
EXECUTE FUNCTION delete_customer();
