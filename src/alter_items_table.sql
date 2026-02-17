ALTER TABLE public."Items"
ADD CONSTRAINT "CheckQuantity"
CHECK ("Quantity" >= 0),
ADD CONSTRAINT "CheckTotal"
CHECK ("Total" >= 0);
