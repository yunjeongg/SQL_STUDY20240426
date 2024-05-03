
-- 집합 연산자
-- ## UNION
-- 1. 합집합 연산의 의미입니다. (1.2.3, 3.4.5 -> 12345
-- 2. 첫번째 쿼리와 두번째 쿼리의 중복정보는 한번만 보여줍니다.
-- 3. 첫번째 쿼리의 열의 개수와 타입이 두번째 쿼리의 열수와 타입과 동일해야 함.
-- 4. 자동으로 정렬이 일어남 (첫번째 컬럼 오름차가 기본값)
-- 5. 성능상 부하가 일어날 수 있음

-- 가로로 하면 JOIN, 세로로 하면 집합연산자.

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231';

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE,
    ADDR -- 첫 번째 테이블에선 4개조회고
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE -- 두 번째 테이블에선 3개조회
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231';
-- 오류난다. 조회하는 컬럼의 개수가 맞아야 하고

SELECT
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION -- (유일한 구분수단이었던 사원번호가 사라지니 이름과 생일이 똑같은 이관심이 2->1이 됨)
SELECT
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231';


-- ## UNION ALL
-- 1. UNION과 같이 두 테이블로 수직으로 합쳐서 보여줍니다.
-- 2. UNION과는 달리 중복된 데이터도 한번 더 보여줍니다.
-- 3. 자동 정렬 기능을 지원하지 않아 성능상 유리합니다.

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION ALL
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231';

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION ALL -- 중복제거없이 합침. (이관심이 2)
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231'; 

SELECT
    EMP_NO EN1,  -- 둘 모두에게 별칭을 줬을때
    BIRTH_DE BD1 -- 위에있는 테이블의 별칭이 들어감
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION ALL -- 중복제거없이 합침. (이관심이 2)
SELECT
    EMP_NO EN2,
    BIRTH_DE BD2
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231'; 


-- ## INTERSECT
-- 1. 첫번째 쿼리와 두번째 쿼리에서 중복된 행만을 출력합니다.
-- 2. 교집합의 의미입니다.
SELECT  -- 사원의 자격증 취득 정보
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE C.certi_nm = 'SQLD' -- 사원 중 SQLD딴 사람
INTERSECT
SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%용인%'; -- 용인에 사는 사람들이 딴 자격증


SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%용인%'
    AND C.certi_nm = 'SQLD'
;

-- ## MINUS(EXCEPT) 오라클에서 용어(SQL에서 용어) 
-- 1. 두번째 쿼리에는 없고 첫번째 쿼리에만 있는 데이터를 보여줍니다.
-- 2. 차집합의 개념입니다. (1.2.3, 3.4.5 -> 

SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100001'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100004'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE sex_cd = '1'
;

-- 집합연산자에서 ORDER BY 는 맨 마지막에 한번만 넣을 수 있다.




