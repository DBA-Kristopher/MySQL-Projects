show engines;
Create database MIAMI;
use MIAMI;

Create Table MIAMI_EMP (MIAMI_EMPNO int(4) NOT NULL auto_increment, ENAME varchar(32) not null default'',
job varchar(32) not null default 'unemployed', sal int(8), primary key(MIAMI_EMPNO), index name(ENAME))
engine=MyISAM
Default Charset=latin1;
show create table miami_emp;

insert into Miami_emp
values(8369,	'SMITH'	,'CLERK',	800);
insert into Miami_emp
values(8499,	'ALLEN',	'SALESMAN',	1600);
insert into Miami_emp
values(8521,	'WARD',	'SALESMAN',	1250);

-- Main Table

Create table DEPT (DEPTNO int(5), primary key(DEPTNO),
 dname varchar(32), loc char(5))
 engine=MyISAM
Default Charset=latin1; 

insert into dept 
values (10, 'HR', 'MIAMI');
insert into dept 
values (30, 'Marketing', 'MIAMI');
insert into dept 
values (20, 'MID MANAGEMENT', 'MIAMI');
select * from MIAMI_EMP;
Select * from dept;
Select * from dept where loc ='MIAMI';

Create view CONSOL_EMP AS
select * from miami_emp;
select * from consol_emp;













