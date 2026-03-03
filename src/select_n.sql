SELECT "LastName", "FirstName", "Phone", "E-Mail"
FROM public."Customers" c
WHERE EXISTS (
    SELECT 1
    FROM public."Orders" o
    WHERE o."IdCustomer" = c."IdCustomer"
);
