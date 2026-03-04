SELECT "LastName", "FirstName", "Phone", "E-Mail", "City", "Address", "Status", "PaidDate"
FROM public."Customers" c
JOIN public."Orders" o
ON c."IdCustomer" = o."IdCustomer"
WHERE o."ShipDate" IS NULL AND NOW() - o."PaidDate" > INTERVAL '10 days'
ORDER BY c."City", c."LastName";
