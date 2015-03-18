
create user ZJS
  identified by "123456"
  default tablespace TS_ZJS
  temporary tablespace TEMP
  profile DEFAULT;
grant CONNECT to ZJS with admin option;
grant DBA to ZJS;
grant RESOURCE to ZJS with admin option;
grant ALTER ANY SEQUENCE to ZJS;
grant ANALYZE ANY to ZJS;
grant CREATE ANY INDEX to ZJS;
grant CREATE ANY PROCEDURE to ZJS;
grant CREATE ANY SEQUENCE to ZJS;
grant CREATE ANY SYNONYM to ZJS with admin option;
grant CREATE ANY TABLE to ZJS;
grant CREATE ANY VIEW to ZJS;
grant CREATE PROCEDURE to ZJS with admin option;
grant CREATE PUBLIC SYNONYM to ZJS with admin option;
grant CREATE TABLE to ZJS with admin option;
grant CREATE VIEW to ZJS with admin option;
grant DELETE ANY TABLE to ZJS;
grant DROP ANY PROCEDURE to ZJS with admin option;
grant DROP ANY SEQUENCE to ZJS;
grant DROP ANY SYNONYM to ZJS with admin option;
grant DROP ANY TABLE to ZJS with admin option;
grant DROP ANY VIEW to ZJS with admin option;
grant DROP PUBLIC SYNONYM to ZJS with admin option;
grant EXECUTE ANY PROCEDURE to ZJS;
grant INSERT ANY TABLE to ZJS;
grant SELECT ANY DICTIONARY to ZJS with admin option;
grant SELECT ANY SEQUENCE to ZJS;
grant SELECT ANY TABLE to ZJS;
grant UNLIMITED TABLESPACE to ZJS with admin option;
grant UPDATE ANY TABLE to ZJS;



CREATE TABLESPACE TS_ZJS 
    NOLOGGING 
    DATAFILE '/oracle/product/10.2.0/dbs/TS_ZJS.dbf' SIZE 10M 
    REUSE AUTOEXTEND 
    ON NEXT  1280K MAXSIZE  32767M EXTENT MANAGEMENT LOCAL 
    SEGMENT SPACE MANAGEMENT  AUTO ;
