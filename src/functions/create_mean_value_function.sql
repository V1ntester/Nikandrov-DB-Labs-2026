CREATE FUNCTION mean_value (
    value1 real DEFAULT 0,
    value2 real DEFAULT 0,
    value3 real DEFAULT 0
)
RETURNS real
LANGUAGE SQL
AS $$
SELECT (value1 + value2 + value3) / 3 ::real
$$;
