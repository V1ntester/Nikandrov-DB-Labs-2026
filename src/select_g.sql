SELECT *
FROM public."Orders"
WHERE "IdCustomer" IN (
    SELECT "IdCustomer"
    FROM public."Customers"
    WHERE "City" = 'Москва'
);
