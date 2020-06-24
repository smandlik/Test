--liquibase formatted sql



--changeset Data:10
insert into liquib.company1 ( id, name, address1, address2, city) values ('04', 'XYZA Limited', 'Nashville', 'TN', 'HERMITAGE');

--Changeset Function:9

CREATE OR REPLACE PACKAGE LIQUIB.GET_Company AS

  PROCEDURE GET_ROWCOUNT(sDBErrorDesc            OUT VARCHAR2,
                           sProcAction             OUT VARCHAR2,
                           sExpectedVersion     IN     VARCHAR2,
                           bValidityCheckOnly   IN     INTEGER,
                           sVersionFound        IN OUT VARCHAR2,
                        flag OUT VARCHAR2);

END GET_Company;
/
CREATE OR REPLACE PACKAGE BODY LIQUIB.GET_Company AS


  PROCEDURE GET_ROWCOUNT(sDBErrorDesc            OUT VARCHAR2,
                           sProcAction             OUT VARCHAR2,
                           sExpectedVersion     IN     VARCHAR2,
                           bValidityCheckOnly   IN     INTEGER,
                           sVersionFound        IN OUT VARCHAR2,
                        flag OUT VARCHAR2)
                        AS
  rCount NUMBER (2);
  BEGIN
  rCount := 0;
  SELECT COUNT(*) INTO rCount FROM liquib.company;
  IF rCount > 0  THEN   flag := 'S';
  ELSE  flag := 'E';
  END if;
  END;

END GET_Company;
/