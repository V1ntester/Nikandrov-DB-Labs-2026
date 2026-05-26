CREATE OR REPLACE FUNCTION save_new_order()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'New order inserted: ID=%, Customer=%, Date=%, Status=%', 
                 NEW."IdOrder", NEW."IdCustomer", NEW."OrderDate", NEW."Status";
    
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_orders_save_to_temp
AFTER INSERT ON "Orders"
FOR EACH ROW
EXECUTE FUNCTION save_new_order();
