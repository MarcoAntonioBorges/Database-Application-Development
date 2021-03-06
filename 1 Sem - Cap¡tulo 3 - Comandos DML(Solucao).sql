--01
CREATE TABLE my_employee
  (id  NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
   last_name VARCHAR2(25),
   first_name VARCHAR2(25),
   userid  VARCHAR2(8),
   salary  NUMBER(9,2));

--02
DESCRIBE my_employee

--03
INSERT INTO my_employee
  VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

--04
INSERT INTO my_employee (id, last_name, first_name,                 
                         userid, salary)
  VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

--05
SELECT   *
FROM     my_employee;

--06
SET ECHO OFF
SET VERIFY OFF
INSERT INTO my_employee
VALUES (&p_id, '&&p_last_name', '&&p_first_name',
        lower(substr('&p_first_name', 1, 1) || 
        substr('&p_last_name', 1, 7)), &p_salary);

SET VERIFY ON
SET ECHO ON
UNDEFINE p_first_name
UNDEFINE p_last_name

--07
SET ECHO OFF
SET VERIFY OFF
INSERT INTO my_employee
VALUES (&p_id, '&&p_last_name', '&&p_first_name',
        lower(substr('&p_first_name', 1, 1) || 
        substr('&p_last_name', 1, 7)), &p_salary);

SET VERIFY ON
SET ECHO ON
UNDEFINE p_first_name
UNDEFINE p_last_name

--08
SELECT   *
FROM my_employee;

--09
COMMIT;

--10
UPDATE  my_employee
SET     last_name = 'Drexler'
WHERE   id = 3;

--11
UPDATE  my_employee
SET     salary = 1000 
WHERE   salary < 900;

--12
SELECT  last_name, salary 
FROM    my_employee;

--13
DELETE
FROM  my_employee 
WHERE last_name = 'Dancs';

--14
SELECT  *
FROM    my_employee;

--15
COMMIT;
