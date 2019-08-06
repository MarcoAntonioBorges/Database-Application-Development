SET SERVEROUTPUT ON;


CREATE TABLE MESSAGES(messages varchar(255));

CREATE TABLE top_emps(nome varchar(255), salary varchar(255));

BEGIN
    FOR I IN 1..10 LOOP
    IF MOD(I, 2) <> 0 THEN
        INSERT INTO MESSAGES VALUES(I);
    END IF;
    END LOOP;
    commit;
END;

SELECT * FROM MESSAGES;

accept p_qtd prompt 'informe a qtd de func'
DECLARE
    v_qtd int := &p_qtd;
    v_ln employees.last_name%type;
    v_sal employees.salary%type;
    cursor emp_cur is select last_name, salary from employees order by salary desc;
BEGIN
    open emp_cur;
    fetch emp_cur into v_ln, v_sal;
    while emp_cur%found and emp_cur%rowcount<=v_qtd loop
        DBMS_OUTPUT.PUT_LINE(v_ln || ' ' || v_sal);
        insert into top_emps values(v_ln, v_sal);
        fetch emp_cur into v_ln, v_sal;
    end loop
    commit;
    close emp_cur;
END;

select * from top_emps;