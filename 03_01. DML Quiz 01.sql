-- 실습 1 
-- 1. employees테이블에서 first_name, last_name, salary를 조회하세요.
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM EMPLOYEES;

-- 2. departments테이블에서 department_id, department_name, manager_id, location_id를 조회하세요.
SELECT
    department_id,
    department_name,
    manager_id,
    departments.location_id
FROM DEPARTMENTS;

-- 3. employees테이블에서 first_name의 별칭을 '이름', salary의 별칭을 '급여'로 조회하세요.
SELECT
    FIRST_NAME 이름,
    SALARY 급여
FROM EMPLOYEES;

-- 4. employees테이블의 사원정보를 first_name + last_name + '의 급여는 $' + salary + '입니다.' 의 형태로 연결하여 '사원정보' 라는 별칭을 부여하여 하나의 컬럼으로 조회하세요.
SELECT
    FIRST_NAME || LAST_NAME || '의 급여는 $' || SALARY || '입니다.' AS 사원정보
FROM EMPLOYEES;

-- 5. employees테이블에서 department_id를 중복을 제거하여 조회하세요.
SELECT DISTINCT
    DEPARTMENT_ID
FROM employees;

-- 실습 2
-- 1. employees테이블에서 job_id가 'IT_PROG'인 사원의 first_name, job_id, department_id를 조회하세요.
SELECT
    FIRST_NAME,
    JOB_ID,
    DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

-- 2. employees테이블에서 last_name이 'King'인 사원의 first_name, last_name, hire_date를 조회하세요.
SELECT
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

-- 3. employees테이블에서 salary가 15000보다 크거나 같은 사원의 first_name, salary, hire_date를 조회하세요.
SELECT
    FIRST_NAME,
    SALARY,
    HIRE_DATE
FROM EMPLOYEES
WHERE SALARY >= '15000';

-- 4. employees테이블에서 salary가 10000과 12000 사이에 있는 사원의 first_name, salary를 조회하세요.
SELECT
    FIRST_NAME,
    SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN '10000' AND '12000';

-- 5. employees테이블에서 manager_id가 101, 102, 103중에 속하는 사원의 first_name, salary, manager_id를 조회하세요.
SELECT
    FIRST_NAME,
    SALARY,
    MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (101, 102, 103);

-- 6. employees테이블에서 job_id가 'IT_PROG', 'FI_MGR'중에 포함되지 않는 사원의 first_name, job_id를 조회하세요.
SELECT
    FIRST_NAME,
    JOB_ID
FROM EMPLOYEES
WHERE JOB_ID NOT IN ('IT_PROG', 'FI_MGR');

-- 7. employees테이블에서 job_id가 'IT'로 시작하는 사원의 first_name, last_name, job_id를 조회하세요.
SELECT
    FIRST_NAME,
    LAST_NAME,
    JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'IT%';

-- 8. employees테이블에서 email의 두번째 글자가 A인 사원의 first_name, email을 조회하세요.
SELECT
    FIRST_NAME,
    EMAIL
FROM EMPLOYEES
WHERE EMAIL LIKE '_A%';

-- 9. employees테이블에서 manager_id가 null인 사원의 first_name, manager_id를 조회하세요.
SELECT
    FIRST_NAME,
    MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 10. employees테이블에서 commission_pct가 null이 아닌 사원의 first_name, job_id, commission_pct를 조회하세요.
SELECT
    FIRST_NAME,
    JOB_ID,
    commission_pct
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 11. employees테이블에서 job_id가 'IT_PROG'이고 salary가 5000이상인 사원의 first_name, job_id, salary를 조회하세요.
SELECT
    FIRST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' AND SALARY >= '5000';

-- 12. employees테이블에서 job_id가 'IT_PROG'이거나 salary가 5000이상인 사원의 first_name, job_id, salary를 조회하세요.
SELECT
    FIRST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' OR SALARY >= '5000';

-- 13. employees테이블에서 job_id가 'IT_PROG'이거나 'FI_MGR'이면서 salary가 5000이상인 사원의 first_name, job_id, salary를 조회하세요.
SELECT
    FIRST_NAME,
    JOB_ID,
    SALARY
FROM EMPLOYEES
WHERE (JOB_ID = 'IT PROG' OR JOB_ID = 'FI_MGR' )
    AND SALARY >= '5000';
