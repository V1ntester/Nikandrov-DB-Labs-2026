CREATE USER test_user WITH
PASSWORD 'root';

CREATE ROLE "Read_only_test_role" WITH
NOLOGIN
INHERIT;

CREATE ROLE "Create_tables_test_role" WITH
NOLOGIN
INHERIT;

CREATE ROLE "All_privileges_test_role" WITH
NOLOGIN
INHERIT;

GRANT USAGE ON SCHEMA public TO "Read_only_test_role";
GRANT USAGE ON SCHEMA public TO "Create_tables_test_role";
GRANT USAGE ON SCHEMA public TO "All_privileges_test_role";

GRANT SELECT ON ALL TABLES IN SCHEMA public TO "Read_only_test_role";
GRANT CREATE ON SCHEMA public TO "Create_tables_test_role";
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "All_privileges_test_role";

ALTER DEFAULT PRIVILEGES IN SCHEMA public 
GRANT SELECT ON TABLES TO "Read_only_test_role";

ALTER DEFAULT PRIVILEGES IN SCHEMA public 
GRANT ALL PRIVILEGES ON TABLES TO "All_privileges_test_role";

GRANT "Read_only_test_role" TO test_user;
GRANT "Create_tables_test_role" TO test_user;
GRANT "All_privileges_test_role" TO test_user;
