
-- WHERE 조건절
-- 조회 행을 제한
SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    SEX_CD
FROM TB_EMP
WHERE SEX_CD = 2; -- 조건 => 성별코드 2 (여자) 만 조회

-- PK로 필터링을 하면 무조건 1건 이하가 조회된다.
-- 없는번호, 오류가 날 경우 0건
SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    SEX_CD
FROM TB_EMP
WHERE EMP_NO = 1000000003; -- 조건 => 사원번호 조회


-- 비교연산자
SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    SEX_CD
FROM TB_EMP
WHERE SEX_CD != 2; -- 조건 => 2가 아닌경우

SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    SEX_CD
FROM TB_EMP
WHERE SEX_CD <> 2; -- 조건 => 2가 아닌경우

SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    birth_de
FROM TB_EMP
WHERE birth_de >= '19900101'; -- 조건 => 1990년 이후 출생자

SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    birth_de
FROM TB_EMP
WHERE birth_de >= '19800101' -- 조건 => 1980년대생만 조회
    AND BIRTH_DE <= '19891231';
    
SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    birth_de
FROM TB_EMP
WHERE NOT birth_de >= '19800101'; -- 조건 => 1980년 이전 출생자


-- BETWEEN 연산자 ( BETWEEN A AND B, A이상 B이하)
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'; -- 조건 => 1990년생

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'; -- 조건 => 1990년생이 아닌경우


-- IN 연산 : OR 연산
SELECT
    EMP_NO,
    EMP_NM,
    DEPT_CD
FROM TB_EMP
WHERE DEPT_CD = 100002 -- 조건 => 부서번호가 100002 또는 100007 인 경우
    OR DEPT_CD = 100007 

SELECT
    EMP_NO,
    EMP_NM,
    DEPT_CD
FROM TB_EMP
WHERE DEPT_CD IN (100002, 100007,100008); -- 조건 => 부서번호가 100002,100007,100008인 경우

SELECT
    EMP_NO,
    EMP_NM,
    DEPT_CD
FROM TB_EMP
WHERE DEPT_CD NOT IN (100002, 100007,100008);-- 조건 => 부서번호가 100002,100007,100008 이 아닌경우


-- LIKE
-- 검색에서 사용
-- 와일드카드 매핑 ( %: 0글자 이상, _: 딱1글자 )
SELECT
    EMP_NO,
    EMP_NM,
    ADDR
FROM TB_EMP
WHERE ADDR LIKE '%용인%'; -- 조건 => 조회조건에 용인이 포함된 경우, 
-- %문자열% - 문자열 앞뒤에 몇글자가 와도 됨.

SELECT
    EMP_NO,
    EMP_NM,
    ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '이%'; -- 조건 => 성이 이씨인 경우
-- 문자열% - 문자열 뒤에 몇글자가 와도 됨.

SELECT
    EMP_NO,
    EMP_NM,
    ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '이_'; -- 조건 => 성이 이씨인 경우
-- 문자열_ 문자열 뒤에 내용이 딱 1개만 오는 경우.

SELECT
    EMP_NO,
    EMP_NM,
    ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '%심'; -- 조건 => 이름이 심으로 끝나는 경우
-- %문자열 - 문자열 뒤에 몇글자가 와도 됨.

SELECT
    EMAIL
FROM user
WHERE EMAIL LIKE '_A%@%'; -- 조건 => 이메일 두번째글자가 A이고, 이메일에 @가 들어가는 경우
-- 와일드카드 매핑 조합도 가능


-- 성씨가 김씨이면서
-- 부서가 100003, 100004 중 하나이면서
-- 90년대생인 사원의
-- 사번, 이름, 생일, 부서코드를 조회
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE,
    DEPT_CD
FROM TB_EMP
WHERE 1 = 1 -- 언제나 맞으면서(맞는조건 아무거나 됨, 주석처리하기편하게 하기위한 용도)
    AND EMP_NM LIKE '김%'
    AND DEPT_CD IN (100003, 100004)
    AND BIRTH_DE BETWEEN '19900101' AND '19991231';
    
    
-- NULL값 조회 (주의해야함, 시험에도 자주나옴)
-- 반드시 IS NULL로 조회할 것!
SELECT
    EMP_NO,
    EMP_NM,
    direct_manager_emp_no -- 직속상사 조회
FROM TB_EMP;

SELECT
    EMP_NO,
    EMP_NM,
    direct_manager_emp_no -- 직속상사 조회
FROM TB_EMP
WHERE direct_manager_emp_no IS NULL; 
-- NULL을 조회할때는 항상 IS NULL로 해야 함

SELECT
    EMP_NO,
    EMP_NM,
    direct_manager_emp_no -- 직속상사 조회
FROM TB_EMP
WHERE direct_manager_emp_no IS NOT NULL; 
-- 다른조건은 NOT을 붙일때 앞에붙이지만 NULL만 IS뒤에붙임.


-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%'
	AND ADDR LIKE '%수원%' 
    OR ADDR LIKE '%일산%'
    -- 연산자 우선 순위로 인해 
    -- 김씨이면서 수원사는애, 또는 일산사는애 로 잡힘
;

SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%'
	AND (ADDR LIKE '%수원%' 
    OR ADDR LIKE '%일산%')
    -- ()의 우선순위가 젤 크기 때문에
    -- 김씨이면서 수원 또는 일산사는애 로 잡힘
;

--NULL 연산은 결과가 NULL
--NULL + 3 = NULL;
--NULL * 15 = NULL;

    
