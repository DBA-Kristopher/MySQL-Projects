SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
-- -----------------------------------------------------
-- Table `CLIENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CLIENT` ;

CREATE TABLE IF NOT EXISTS `CLIENT` (
  `CLIENT_NO` CHAR(8) NOT NULL,
  `CLIENT_COMPANY` VARCHAR(35) NOT NULL,
  `CLIENT_NAME` VARCHAR(35) NOT NULL,
  `CLIENT_EMAIL` VARCHAR(35) NULL,
  `CLIENT_PROGRAM` CHAR(3) NOT NULL,
  `CLIENT_SCORE` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`CLIENT_NO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COURSE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COURSE` ;

CREATE TABLE IF NOT EXISTS `COURSE` (
  `COURSE_CODE` CHAR(8) NOT NULL,
  `COURSE_NAME` VARCHAR(35) NOT NULL,
  `COURSE_DATE` DATE NOT NULL,
  `COURSE_INSTRUCTOR` VARCHAR(35) NOT NULL,
  `COURSE_LOCATION` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`COURSE_CODE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COURSE_ACTIVITY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COURSE_ACTIVITY` ;

CREATE TABLE IF NOT EXISTS `COURSE_ACTIVITY` (
  `ACTIVITY_CODE` CHAR(8) NOT NULL,
  `CLIENT_NO` CHAR(8) NOT NULL,
  `COURSE_CODE` CHAR(8) NOT NULL,
  `GRADE` CHAR(1) NULL,
  `INSTR_NOTES` VARCHAR(50) NULL,
  PRIMARY KEY (`ACTIVITY_CODE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CORP_EXTRACT1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CORP_EXTRACT1` ;

CREATE TABLE IF NOT EXISTS `CORP_EXTRACT1` (
  `EXTRACT_NO` CHAR(3) NOT NULL,
  `CLIENT_NO` CHAR(8) NOT NULL,
  `CLIENT_NAME` VARCHAR(35) NOT NULL,
  `CLIENT_EMAIL` VARCHAR(35) NULL,
  `CLIENT_COMPANY` VARCHAR(35) NOT NULL,
  `CLIENT_PROGRAM` CHAR(3) NOT NULL,
  `CLIENT_SCORE` DECIMAL(10,0) NOT NULL,
  `COURSE_NAME` VARCHAR(35) NOT NULL,
  `COURSE_DATE` DATE NOT NULL,
  `COURSE_INSTRUCTOR` VARCHAR(35) NOT NULL,
  `COURSE_LOCATION` VARCHAR(20) NOT NULL,
  `COURSE_STATUS` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`EXTRACT_NO`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- CLIENT rows						--
INSERT INTO CLIENT VALUES('C2122542','Bryson, Inc.'    ,'Smithson','smithson@bryson.com'	,'DBA',47);
INSERT INTO CLIENT VALUES('C2122356','SuperLoo, Inc.'  ,'Flushing','flushing@superloo.com'	,'DBA',38);
INSERT INTO CLIENT VALUES('C2123871','D\&E Supply'     ,'Singh'   ,'rsingh@desupply.com'	,'EAI',42);
INSERT INTO CLIENT VALUES('C2134452','Gomez Bros.'     ,'Ortega'  ,'ortega@gomez.com'		,'DBA',39);
INSERT INTO CLIENT VALUES('C2256716','Dome Supply'     ,'Smith'   ,'smith@dome'			,'ADM',41);

-- COURSE rows						--
INSERT INTO COURSE VALUES('DBA12345','DBA 101'		,'2005-10-03','Phung'		,'Kaanapali');
INSERT INTO COURSE VALUES('DBA12346','Advanced DBA'	,'2005-11-23','Browne'		,'San Mateo');
INSERT INTO COURSE VALUES('EAI12345','EAI Intro'	,'2005-11-30','Luss'  		,'Danbury');
INSERT INTO COURSE VALUES('DBA12347','DBA 101'  	,'2006-01-08','Fiorillo'	,'Paramus');
INSERT INTO COURSE VALUES('DBA12348','DBA 101'  IDVAL	,'2006-02-28','Majmundar'	,'Racine');

-- COURSE ACTIVITY rows					--
INSERT INTO COURSE_ACTIVITY VALUES('A0000001','C2122542','DBA12345','A',NULL);
INSERT INTO COURSE_ACTIVITY VALUES('A0000002','C2122356','DBA12347','F',NULL);
INSERT INTO COURSE_ACTIVITY VALUES('A0000003','C2134452','DBA12345','B',NULL);
INSERT INTO COURSE_ACTIVITY VALUES('A0000004','C2122542','DBA12346','A',NULL);
INSERT INTO COURSE_ACTIVITY VALUES('A0000005','C2123871','EAI12345','A',NULL);
INSERT INTO COURSE_ACTIVITY VALUES('A0000006','C2122356','DBA12345',NULL,NULL);

-- CORP_EXTRACT1 rows					--
INSERT INTO CORP_EXTRACT1 VALUES ('001','C2122542','Smithson','smithson@bryson.com','Bryson, Inc.','DBA',47,'EAI Intro','2007-03-01','Luss','Hilo','Enrolled');
INSERT INTO CORP_EXTRACT1 VALUES ('002','C2122356','Flushing','flushing@superloo.com','SuperLoo, Inc.','DBA',38,'DBA 101','2005-10-03','Luss','Hilo','Dropped');
INSERT INTO CORP_EXTRACT1 VALUES ('003','C2172249','Bizet','gbizet@bryson.com','Bryson, Inc.','EAI',44,'EAI Intro','2007-03-01','Luss','Hilo','Enrolled');

-- Start lab -- 
select * from CLIENT;
select * from COURSE;
select * from course_activity;
select * from corp_extract1;
select * from corp_extract2;

-- Step 4 
Select course_activity.client_no as Client, client_name as Name, course_code as Code, grade from client 
join course_activity
using (client_no)
group by client_no;

-- Step 5 --
Select client.client_no as Client, client_name as Name, course_code as Code, grade from client 
right outer join course_activity
on client.client_no = course_activity.CLIENT_NO
where CLIENT_NAME is not null;

-- step 6 --
Select client.client_no as Client, client_name as Name, course_code as Code, grade from client 
left outer join course_activity
on client.client_no = course_activity.CLIENT_NO
where CLIENT_NAME is not null;

-- step 7
Select client.client_no as Client, client_name as Name, course_code as Code, grade from client 
natural join course_activity
where CLIENT_NAME is not null;

-- Step 8
Select client.client_no as Client, client_name as Name, course_code as Code, grade from client 
inner join course_activity
on client.client_no = course_activity.CLIENT_NO
where CLIENT_NAME is not null;

-- step 9
select client_no from client
union
select client_no from corp_extract1;

select client_no from course_activity
union
select client_no from corp_extract1;

select course_name from course
union
select client_no from corp_extract1;

-- step 10
select client_no from client
union all
select client_no from corp_extract1;

select client_no from course_activity
union all
select client_no from corp_extract1;

select course_name from course
union all
select client_no from corp_extract1;

-- step 11
Select client.client_no from client 
inner join course_activity
on client.client_no = course_activity.CLIENT_NO
where CLIENT_Name is not null;

Select course_activity.client_no from course_activity 
inner join corp_extract1
on course_activity.client_no = corp_extract1.CLIENT_NO
where CLIENT_Name is not null;

Select course.COURSE_NAME from course 
inner join corp_extract1
on course.COURSE_NAME = corp_extract1.Course_Name
where CLIENT_NO is not null;

-- Step 12
select client_no from course_activity
MINUS
select client_no from corp_extract1;

select COURSE_NAME from course
MINUS
select Course_name from corp_extract1;

-- Step 13
Select Client_no from client
WHERE CLIENT_NAME NOT IN
    (SELECT client_name
     FROM corp_extract1
     WHERE client_name = 'Mountain Bikes');
     
Select client_no from course_activity
WHERE client_no NOT IN
    (SELECT client_no
     FROM corp_extract1
     WHERE client_no = 'Mountain Bikes');
     
-- Test Explain Command
Explain select * from Client;
explain select client_no from CLient;
-- Test analyze command 
-- Sample 1 vs Sample 2

     
-- Lab 2
-- Week 2
Explain Select * from course;

-- question 8
EXPLAIN
SELECT * FROM COURSE
ORDER BY COURSE_CODE;

-- Q 16 
Select * from course;
Alter table Course add index index_course(COURSE_CODE);

EXPLAIN 
SELECT COURSE_NAME, CLIENT_NAME, GRADE
FROM COURSE c, COURSE_ACTIVITY ca, CLIENT cl
WHERE c.COURSE_CODE = ca.COURSE_CODE AND ca.CLIENT_NO=cl.CLIENT_NO
ORDER BY COURSE_NAME, CLIENT_NAME;

-- Q 2.1
CREATE TABLE BIG_TEST_TABLE(ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, VAL INT) ENGINE = InnoDB;
DELIMITER $$
CREATE PROCEDURE prepare_data()
BEGIN
  DECLARE i INT DEFAULT 100;

  WHILE i < 10000 DO
    INSERT INTO BIG_TEST_TABLE (VAL) VALUES (i);
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER  ;
CALL prepare_data();

SELECT COUNT(*) from BIG_TEST_TABLE;

SHOW TABLE STATUS;


OPTIMIZE TABLE BIG_TEST_TABLE;

SHOW TABLE STATUS;

DELETE FROM BIG_TEST_TABLE WHERE mod(ID,2) = 0;

select * from big_test_table;

-- Check percentage fragmentation
SELECT TABLE_SCHEMA, TABLE_NAME, DATA_FREE, 
(DATA_FREE/1024/1024)/((DATA_LENGTH/1024/1024)+(INDEX_LENGTH/1024/1024)) AS RATIO,
(DATA_FREE/DATA_LENGTH) AS FRAG_PERCENT, INDEX_LENGTH FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = "DBM449LAB1" AND TABLE_NAME = "BIG_TEST_TABLE";


ANALYZE TABLE BIG_TEST_TABLE;

Drop table BIG_TEST_TABLE;
Show engines;
select *from mysql.user;

-- use HAVING command in place of where when using SUM function. 
