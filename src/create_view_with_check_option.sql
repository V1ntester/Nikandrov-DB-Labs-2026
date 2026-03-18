CREATE VIEW public."KazanCustomers" AS
SELECT "IdCustomer", "CompanyName", "LastName", "FirstName", "Address", "City", "IndexCode", "Phone", "E-Mail"
FROM public."Customers"
WHERE "City" = 'Казань'
WITH CHECK OPTION;
