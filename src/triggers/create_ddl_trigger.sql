CREATE OR REPLACE FUNCTION prevent_ddl()
RETURNS EVENT_TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE EXCEPTION 'DDL operation not allowed! DROP, ALTER, and TRUNCATE operations are prohibited on protected tables';
END;
$$;

CREATE EVENT TRIGGER trg_prevent_drop_table
ON ddl_command_start
WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION prevent_ddl();
