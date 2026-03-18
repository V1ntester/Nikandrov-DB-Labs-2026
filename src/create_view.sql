CREATE VIEW public."MoscowCustomers" AS
SELECT "IdCustomer", "CompanyName", "LastName", "FirstName" AS "Name", "Address", "City", "IndexCode", "Phone", "E-Mail"
FROM public."Customers";
