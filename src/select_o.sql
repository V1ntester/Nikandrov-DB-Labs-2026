SELECT "LastName", "FirstName",
CASE 
    WHEN "City" = 'Москва' THEN 'В Москве'
    ELSE 'Не в Москве'
END AS "Location"
FROM public."Customers";
