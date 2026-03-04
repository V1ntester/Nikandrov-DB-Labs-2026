SELECT "IdProduct", SUM("Total") as "Total"
FROM public."Items"
GROUP BY "IdProduct"
HAVING SUM("Total") > 100000;
