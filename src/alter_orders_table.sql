ALTER TABLE public."Orders"
ALTER COLUMN "OrderDate" SET DEFAULT CURRENT_TIMESTAMP,
ADD CONSTRAINT "CheckOrderDate"
CHECK ("OrderDate" <= CURRENT_TIMESTAMP),
ADD CONSTRAINT "CheckShipDate"
CHECK ("ShipDate" IS NULL OR "ShipDate" <= CURRENT_TIMESTAMP AND "ShipDate" >= "OrderDate"),
ADD CONSTRAINT "CheckPaidDate"
CHECK ("PaidDate" IS NULL OR "PaidDate" <= CURRENT_TIMESTAMP AND "PaidDate" >= "OrderDate");
