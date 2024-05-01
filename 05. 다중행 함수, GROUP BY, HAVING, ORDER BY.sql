
SELECT
    *
FROM TB_SAL_HIS;

-- 집계 함수 (다중행 함수)
-- 여러 행을 묶어서 한번에 함수를 적용

SELECT
    COUNT(*)
FROM TB_SAL_HIS;

SELECT
    SUBSTR(EMP_NM, 1, 1)
FROM TB_EMP;

SELECT
    COUNT(*) "지급횟수",
    SUM(PAY_AMT) "지금총액",
    AVG(PAY_AMT) "평균 지급액",
    MAX(PAY_AMT) "최대 지급액",
    MIN(PAY_AMT) "최소 지급액"
FROM TB_SAL_HIS;

// *은 집계할 때 총 건수를 구함
SELECT
    * -- 총 41행
FROM TB_EMP;

SELECT
    COUNT(*) -- 총 41건, 조회한 횟수 세는 함수
FROM TB_EMP;

SELECT
    EMP_NM
FROM TB_EMP;

SELECT
    COUNT(EMP_NM)
FROM TB_EMP
WHERE EMP_NM LIKE '김%';

-- 집계함수는 집계할 때 NULL을 빼고 조회
SELECT
    COUNT(DIRECT_MANAGER_EMP_NO) -- 총 40건
FROM TB_EMP;

CREATE TABLE quiz_50 (
    col1 NUMBER(10),
    col2 NUMBER(10),
    col3 NUMBER(10)
);

INSERT INTO quiz_50 VALUES (10, 20, null);
INSERT INTO quiz_50 VALUES (15, null, null);
INSERT INTO quiz_50 VALUES (50, 70, 20);

SELECT * FROM quiz_50;

SELECT SUM(col2) FROM quiz_50;

SELECT SUM(col1 + col2 + col3) FROM quiz_50;

SELECT col1 + col2 + col3 FROM quiz_50;

-- 회사 전체
SELECT
    COUNT(EMP_NO) "총 사원수",
    MIN(BIRTH_DE) "최연장자 생일", -- 생일이 제일 작다 = 나이제일많다
    MAX(BIRTH_DE) "최연소자 생일"
FROM TB_EMP;


-- 부서 별
-- 부서별 사원 수가 몇명인가?
-- 부서별로 최연장자의 생일은 언제인가?

-- GROUP BY : 지정된 컬럼으로 소그룹화 한 후
-- 각 그룹별로 집계함수를 각각 적용
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE,
    DEPT_CD
FROM TB_EMP
ORDER BY DEPT_CD;

SELECT
    COUNT(*) "부서별 사원수",
    MIN(BIRTH_DE) "부서별 최연장자 생일"
FROM TB_EMP
GROUP BY DEPT_CD;

SELECT
    EMP_NO "사원번호", -- 사원번호 별
    TO_CHAR(SUM(PAY_AMT),'L999,999,999')"사원별 총급여액", -- 총 지급 급여액
    TO_CHAR(ROUND(AVG(PAY_AMT), 2),'L999,999,999.99')"사원별 평균급여액", -- 평균 급여액
    TO_CHAR(MAX(PAY_AMT),'L999,999,999')"사원별 최고급여액", -- 가장 많이 받은 달의 급여
    COUNT(PAY_DE)"급여수령횟수" -- 급여 수령 횟수
FROM TB_sal_his
group by emp_no
order by emp_no;

SELECT
    EMP_NO
FROM TB_EMP; // 41행 조회하고

SELECT
    COUNT(*)
FROM TB_EMP; // 1행 조회하기에

-- 조회 개수가 달라지기에 조회시 일반과 그룹함수는 같이 사용 불가
-- 각각 조회해야함

-- GROUP BY 절에 사용한 컬럼만
-- SELECT에서 그룹함수와 같이 조회 가능
SELECT
    SEX_CD,
    COUNT(*)
FROM TB_EMP
GROUP BY SEX_CD;

SELECT
    DEPT_CD, -- 부서조회
    SEX_CD, -- 성별조회
    COUNT(*), -- 모두
    MAX(BIRTH_DE) -- 나이 젤어린애
FROM TB_EMP
GROUP BY DEPT_CD, SEX_CD -- 그룹,성별
ORDER BY DEPT_CD;

-- 사원별로 2019년에 급여 평균액,
-- 최소지급액, 최대지급액 조회

-- WHERE : 집계하기 전에 필터링하고싶을 때
SELECT
    EMP_NO "사원번호", -- 사원번호 별
    TO_CHAR(SUM(PAY_AMT),'L999,999,999')"사원별 총급여액", -- 총 지급 급여액
    TO_CHAR(ROUND(AVG(PAY_AMT), 2),'L999,999,999.99')"사원별 평균급여액", -- 평균 급여액
    TO_CHAR(MAX(PAY_AMT),'L999,999,999')"사원별 최고급여액", -- 가장 많이 받은 달의 급여
    COUNT(PAY_DE)"급여수령횟수" -- 급여 수령 횟수
FROM TB_sal_his
WHERE PAY_DE BETWEEN '20190101' AND '20191231' -- 2019년에 수령한
group by EMP_NO
order by EMP_NO;

-- HAVING : 집계한 후 필터링하고싶을 때
SELECT
    EMP_NO "사원번호", -- 사원번호 별
    TO_CHAR(SUM(PAY_AMT),'L999,999,999')"사원별 총급여액", -- 총 지급 급여액
    TO_CHAR(ROUND(AVG(PAY_AMT), 2),'L999,999,999.99')"사원별 평균급여액", -- 평균 급여액
    TO_CHAR(MAX(PAY_AMT),'L999,999,999')"사원별 최고급여액", -- 가장 많이 받은 달의 급여
    COUNT(PAY_DE)"급여수령횟수" -- 급여 수령 횟수
FROM TB_sal_his
WHERE PAY_DE BETWEEN '20190101' AND '20191231' -- 1. 2019년에 수령한 급여중
group by EMP_NO
HAVING AVG(PAY_AMT) >= 4000000 2. 급여가 400만원 이상일 때
order by EMP_NO;

-- 부서별로 가장 어린사람의 생년월일, 연장자의 생년월일, 부서별 총 사원 수를 조회
-- 그런데 부서별 사원이 1명인 부서의 정보는 조회하고 싶지 않음.
SELECT
    DEPT_CD,
    MAX(BIRTH_DE),
    MIN(BIRTH_DE),
    COUNT(*)
FROM TB_EMP
GROUP BY DEPT_CD
HAVING COUNT(*) > 1
ORDER BY DEPT_CD;

-- SELECT 문장 실행 순서
-- FROM ~로부터 WHERE ~집계전조건 GROUP BY 집계 HAVING 집계후조건 SELECT 조회 ORDERBY 정렬


-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값), DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no -- 아무것도 안적혀있으면 기본값 오름차순ASC
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm ASC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd, emp_nm DESC
;


SELECT 
    emp_no AS 사번
    , emp_nm AS 이름 -- 이런식으로 별칭을 설정해두고
    , addr AS 주소
FROM tb_emp
ORDER BY 이름 DESC -- 별칭으로 명령을 내리는 것도 가능함.
;

SELECT 
    emp_no  --1
    , emp_nm --2
    , dept_cd --3 암묵적으로 이런식으로 번호가 있고
FROM tb_emp
ORDER BY 3 ASC, 1 DESC --암묵적 번호로 명령을 내리는 것도 가능하다.
;


SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC -- 암묵적숫자, 컬럼, 별칭 다 혼용 가능하다.
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 이름, 1 DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;

SELECT 
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC
;


-- 사원별로 2019년 월평균 수령액이 450만원 이상인 사원의 사원번호와 2019년 연봉 조회
SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC -- 이런식으로 집계함수로 명령을 내리는 것도 가능하다.
;

SELECT
    emp_nm,
    direct_manager_emp_no
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC; 
-- 오라클에서는 NULL이 가장 크고 다른 DB에서는 NULL이 가장 작은 경우도 있다.
-- 다 다를 수 있다.






