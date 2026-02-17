ALTER TABLE public."Customers"
ADD CONSTRAINT "CheckPhoneFormat"
CHECK ("Phone" ~ '^\+\d\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$'),
ADD CONSTRAINT "CheckE-Mail"
CHECK ("E-Mail" ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
ALTER COLUMN "IndexCode" TYPE character varying(12);
