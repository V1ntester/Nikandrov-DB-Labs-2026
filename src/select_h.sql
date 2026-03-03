SELECT *
FROM public."Customers"
WHERE "CompanyName" LIKE 'ООО%' AND CONCAT("LastName", ' ', "FirstName") = 'Иванов Петр';
