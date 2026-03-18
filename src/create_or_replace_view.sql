CREATE OR REPLACE VIEW public."MoscowCustomers" AS
SELECT "IdCustomer", "CompanyName", "LastName", "FirstName", "Address", "City", "IndexCode", "Phone", "E-Mail"
FROM public."Customers"
WHERE "City" = 'Москва';
