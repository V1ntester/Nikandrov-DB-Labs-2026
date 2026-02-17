ALTER TABLE public."Products"
ADD CONSTRAINT "CheckPrPrice"
CHECK ("PrPrice" >= 0),
ADD CONSTRAINT "CheckInStock"
CHECK ("InStock" >= 0),
ADD CONSTRAINT "CheckReOrder"
CHECK ("ReOrder" >= 0);
