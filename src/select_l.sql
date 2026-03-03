SELECT "LastName", "FirstName", "Phone", "E-Mail", "Status"
FROM public."Customers" c
JOIN public."Orders" o ON c."IdCustomer" = o."IdCustomer";
