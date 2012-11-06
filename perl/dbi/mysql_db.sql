create database phonebill;
create user 'ligasgr'@'localhost' IDENTIFIED by 'pass';
grant all privileges on *.* to 'ligasgr'@'localhost' with grant option;
use phonebill;
create table `call` (recipient varchar(255), calldate date, calltime time, duration INT);
insert into `call` values ('sb', now(), now(), 5);
insert into `call` values ('sb', now(), now(), 65);
insert into `call` values ('sb else', now(), now(), 85);

