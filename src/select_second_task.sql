SELECT "City", COUNT(*) AS "Count"
FROM public."Customers" c
JOIN public."Orders" o ON c."IdCustomer" = o."IdCustomer"
WHERE o."PaidDate" IS NOT NULL
GROUP BY c."City"
ORDER BY "Count" DESC;
