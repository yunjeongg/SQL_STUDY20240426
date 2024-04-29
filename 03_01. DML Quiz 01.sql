-- �ǽ� 1 
-- 1. employees���̺��� first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM EMPLOYEES;

-- 2. departments���̺��� department_id, department_name, manager_id, location_id�� ��ȸ�ϼ���.
SELECT
    department_id,
    department_name,
    manager_id,
    departments.location_id
FROM DEPARTMENTS;

-- 3. employees���̺��� first_name�� ��Ī�� '�̸�', salary�� ��Ī�� '�޿�'�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME �̸�,
    SALARY �޿�
FROM EMPLOYEES;

-- 4. employees���̺��� ��������� first_name + last_name + '�� �޿��� $' + salary + '�Դϴ�.' �� ���·� �����Ͽ� '�������' ��� ��Ī�� �ο��Ͽ� �ϳ��� �÷����� ��ȸ�ϼ���.
SELECT
    FIRST_NAME || LAST_NAME || '�� �޿��� $' || SALARY || '�Դϴ�.' AS �������
FROM EMPLOYEES;

-- 5. employees���̺��� department_id�� �ߺ��� �����Ͽ� ��ȸ�ϼ���.
SELECT DISTINCT
    DEPARTMENT_ID
FROM employees;

-- �ǽ� 2
-- 1. employees���̺��� job_id�� 'IT_PROG'�� ����� first_name, job_id, department_id�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    JOB_ID,
    DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

-- 2. employees���̺��� last_name�� 'King'�� ����� first_name, last_name, hire_date�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

-- 3. employees���̺��� salary�� 15000���� ũ�ų� ���� ����� first_name, salary, hire_date�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    SALARY,
    HIRE_DATE
FROM EMPLOYEES
WHERE SALARY >= '15000';

-- 4. employees���̺��� salary�� 10000�� 12000 ���̿� �ִ� ����� first_name, salary�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN '10000' AND '12000';

-- 5. employees���̺��� manager_id�� 101, 102, 103�߿� ���ϴ� ����� first_name, salary, manager_id�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    SALARY,
    MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (101, 102, 103);

-- 6. employees���̺��� job_id�� 'IT_PROG', 'FI_MGR'�߿� ���Ե��� �ʴ� ����� first_name, job_id�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    JOB_ID
FROM EMPLOYEES
WHERE JOB_ID NOT IN ('IT_PROG', 'FI_MGR');

-- 7. employees���̺��� job_id�� 'IT'�� �����ϴ� ����� first_name, last_name, job_id�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    LAST_NAME,
    JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'IT%';

-- 8. employees���̺��� email�� �ι�° ���ڰ� A�� ����� first_name, email�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    EMAIL
FROM EMPLOYEES
WHERE EMAIL LIKE '_A%';

-- 9. employees���̺��� manager_id�� null�� ����� first_name, manager_id�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 10. employees���̺��� commission_pct�� null�� �ƴ� ����� first_name, job_id, commission_pct�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    JOB_ID,
    commission_pct
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 11. employees���̺��� job_id�� 'IT_PROG'�̰� salary�� 5000�̻��� ����� first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' AND SALARY >= '5000';

-- 12. employees���̺��� job_id�� 'IT_PROG'�̰ų� salary�� 5000�̻��� ����� first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' OR SALARY >= '5000';

-- 13. employees���̺��� job_id�� 'IT_PROG'�̰ų� 'FI_MGR'�̸鼭 salary�� 5000�̻��� ����� first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE (JOB_ID = 'IT PROG' OR JOB_ID = 'FI_MGR' )
    AND SALARY >= '5000';
