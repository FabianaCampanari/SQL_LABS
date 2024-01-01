-- CHAPTER 10
USE ORDERS;

-- LEN - counts the number of characters
SELECT LEN('Brazil');

-- Replicates the text
SELECT REPLICATE('Test', 4);

-- Reverses the text
SELECT REVERSE('animal');

-- Converts a number to text
SELECT STR(213);

-- Returns a part of the text from a defined position
SELECT SUBSTRING('Parallelepiped', 3, 7);

-- Concatenates strings
SELECT CONCAT('SQL ', 'module ', 'I');

-- Charindex
SELECT CHARINDEX('A', 'HOUSE')

-- Formats an expression
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy');

SELECT NAME, SALARY, CASE UNIONIZED
                        WHEN 'Y' THEN 'Yes'
                        WHEN 'N' THEN 'No'
                        ELSE 'N/A'
                      END AS [Unionized?] ,
       HIRE_DATE
FROM TB_EMPLOYEE;


SELECT NAME, SALARY, HIRE_DATE, 
       CASE DATEPART(WEEKDAY, HIRE_DATE)
            WHEN 1 THEN 'Sunday'
            WHEN 2 THEN 'Monday'
            WHEN 3 THEN 'Tuesday'
            WHEN 4 THEN 'Wednesday'
            WHEN 5 THEN 'Thursday'
            WHEN 6 THEN 'Friday'
            WHEN 7 THEN 'Saturday'      
       END AS WEEKDAY       
FROM TB_EMPLOYEE;

SELECT NAME, PHONE1 FROM TB_CUSTOMER
UNION 
SELECT NAME, PHONE1 FROM TB_CUSTOMER ORDER BY NAME;

SELECT NAME, PHONE1 FROM TB_CUSTOMER
UNION ALL
SELECT NAME, PHONE1 FROM TB_CUSTOMER ORDER BY NAME;

SELECT DEPT_CODE FROM TB_DEPARTMENT
INTERSECT
SELECT DEPT_CODE FROM TB_EMPLOYEE
WHERE SALARY > 5000


SELECT DEPT_CODE FROM TB_DEPARTMENT 
EXCEPT 
SELECT DEPT_CODE FROM TB_EMPLOYEE



SELECT JOB_CODE FROM TB_JOB
EXCEPT 
SELECT JOB_CODE FROM TB_EMPLOYEE


SELECT CUST_CODE FROM TB_CUSTOMER
INTERSECT
SELECT CUST_CODE FROM TB_ORDER
WHERE ISSUE_DATE BETWEEN '2014-01-01' AND '2014-01-31'

SELECT CUST_CODE FROM TB_CUSTOMER
EXCEPT
SELECT CUST_CODE FROM TB_ORDER
WHERE ISSUE_DATE BETWEEN '2014-01-01' AND '2014-01-31'
