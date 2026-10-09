
/*Question 6: Hospital Staff and Department Management System
A. Theory:
Explain the purpose of DISTINCT, LIKE, IN, and BETWEEN in SQL. Describe how these operators are used with the WHERE clause. Also explain the difference between COUNT(*) and COUNT(column_name), and describe how column aliases are used to make query results easier to understand.
B. Practical:
Create a Hospital Staff Management System using Department and Staff tables.
1. Create both tables with suitable attributes and establish a Primary Key and Foreign Key relationship.
2. Apply appropriate NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
3. Insert at least 4 department records and 6 staff records.
4. Display staff members whose salaries fall between ₹25,000 and ₹50,000.
5. Display staff members whose names start with a specified letter using LIKE.
6. Display staff members belonging to selected departments using IN.
7. Display unique staff designations using DISTINCT.
8. Count the number of staff members in each department using GROUP BY and COUNT().
9. Display the maximum and minimum salary using MAX() and MIN().
10. Update the salary of a staff member.
11. Display the final staff records using SELECT with appropriate column aliases.*/

CREATE DATABASE HOSPITAL;
USE HOSPITAL;

CREATE TABLE DEPARTMENT(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(50)
);

CREATE TABLE STAFF(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(50) NOT NULL,
SALARY INT,
EMAIL VARCHAR(50) UNIQUE,
AGE INT CHECK (AGE>18),
DESIGNATION VARCHAR(50),
DEPT_ID INT,
FOREIGN KEY(DEPT_ID)
REFERENCES DEPARTMENT(DEPT_ID)
);

INSERT INTO DEPARTMENT
VALUES
(001, 'EMERGENCY'),
(002, 'ENT'),
(003, 'ORTHOLOGY'),
(004, 'CHILDCARE');

INSERT INTO STAFF
VALUES
(101,'JOSH',50000,'JOSH@GMAIL.COM',29,'SENIOR DOCTOR',001),
(102,'ISHA',45000,'ISHA@GMAIL.COM',27,'JUNIOR DOCTOR',004),
(103,'JULES',46000,'JULES@GMAIL.COM',29,'ASSISTANT',003),
(104,'AVA',40000,'AVA@GMAIL.COM',27,'INTERN',002),
(105,'ALEX',55000,'ALEX@GMAIL.COM',30,'SENIOR DOCTOR',001),
(106,'BRIDGET',50000,'VON@GMAIL.COM',28,'JUNIOR DOCTOR',002);

SELECT *
FROM STAFF
WHERE SALARY BETWEEN 25000 AND 50000;

SELECT EMP_ID,EMP_NAME 
FROM STAFF
WHERE EMP_NAME LIKE 'A%';

SELECT *
FROM STAFF
WHERE DEPT_ID IN (001,003);

SELECT DISTINCT DESIGNATION 
FROM STAFF;

SELECT DEPT_ID, COUNT(*)
FROM STAFF
GROUP BY DEPT_ID;

SELECT MAX(SALARY)
FROM STAFF;

SELECT MIN(SALARY)
FROM STAFF;

UPDATE  STAFF
SET SALARY=56000
WHERE EMP_ID=105;

SELECT EMP_ID AS ID,EMP_NAME AS STAFF,EMAIL,AGE
FROM STAFF;

SELECT*
FROM STAFF;
