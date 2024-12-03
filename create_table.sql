create user netflix identified by 123;
grant create session to netflix;
GRANT CREATE TABLE TO netflix;
GRANT CREATE VIEW TO netflix;
GRANT CREATE SEQUENCE TO netflix;
GRANT CREATE PROCEDURE TO netflix;
commit;

create table netflix_t1 (
 show_id varchar2(10) primary key,
 type varchar2(15),
 title varchar2(30),
 director varchar2(20),
 cast varchar2(100),
 country varchar2(30),
 date_added date,
 actual_release number,
 rating varchar2(15),
 duration varchar2(20)
);
