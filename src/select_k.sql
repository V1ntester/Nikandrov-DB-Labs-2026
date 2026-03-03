SELECT "IdProduct"
FROM public."Items"
GROUP BY "IdProduct"
HAVING SUM("Total") > 100000;
