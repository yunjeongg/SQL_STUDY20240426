-- 계층형 쿼리 
-- START WITH : 계층의 첫 단계를 어디서 시작할 것인지의 대한 조건
-- CONNECT BY PRIOR 자식 = 부모  -> 순방향 탐색
-- CONNECT BY 자식 = PRIOR 부모  -> 역방향 탐색
-- ORDER SIBLINGS BY : 같은 레벨끼리의 정렬을 정함.
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
START WITH A.direct_manager_emp_no IS NULL
-- START WITH A.EMP_NO = '1000000037'
CONNECT BY PRIOR A.emp_no = A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no DESC
;


-- 정렬시 그 부모가 가진 자식들도 같이 한 묶음으로 딸려 올라간다.

-- # 서브쿼리 : SQL 안에 SQL이 포함된 구문
-- ## 단일행 서브쿼리 : 조회 결과가 1건 이하
-- 부서코드가 100004번인 부서의 사원들 정보 조회
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE DEPT_CD = '100004'
;

-- Quiz 01. 이나라가 속한 부서의 모든 사원정보 조회
-- 이나라는 부서코드가 몇번일까?
-- 그 부서코드로 모든 사원을 조회하기
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE DEPT_CD = (
    SELECT
        DEPT_CD
    FROM TB_emp
    WHERE EMP_NM = '이나라' -- ()결과 이나라의 부서코드 100004가 나옴 -> Subquery
    )
;

-- 사원이름이 이관심인 사람이 속해 있는 부서의 사원정보 조회
-- 단일행 비교연산자(=, <>, >, >=, <, <=)는 단일행 서브쿼리로만 비교해야 함.
? 발급한 자격증 개수를 조회
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE DEPT_CD = (
    SELECT
        DEPT_CD
    FROM TB_emp
    WHERE EMP_NM = '이관심' -- 결과가 2개라서 단일행에서는 오류남.
;
-- 20200525에 받은 급여가 회사전체의 20200525일 
-- 전체 평균 급여보다 높은 사원들의 정보(사번, 이름, 급여지급일, 받은급여액수) 조회
-- 회사전체 20200525 평균급여 계산
-- 그 평균보다 높은 사원 조회
SELECT
    e.emp_no,
    E.EMP_NM,
    S.PAY_DE,
    S.PAY_AMT
FROM TB_EMP E
JOIN TB_SAL_HIS S
ON E.EMP_NP = S.EMP_NO
WHERE S.PAY_DE = '20200525';
    AND S.PAY_AMT>= 4082927

-- 20200525 회사전체 급여평균
SELECT
    AVG(PAY_AMT)
FROM TB_SAL_HIS
WHERE PAY_DE = '20200525';

-- # 다중행 서브쿼리
-- 서브쿼리의 조회 건수가 0건 이상인 것
-- ## 다중행 연산자
-- 1. IN : 메인쿼리의 비교조건이 서브쿼리 결과중에 하나라도 일치하면 참
--    ex )  salary IN (200, 300, 400)
--            250 ->  200, 300, 400 중에 없으므로 false
-- 2. ANY, SOME : 메인쿼리의 비교조건이 서브쿼리의 검색결과 중 하나 이상 일치하면 참
--    ex )  salary > ANY (200, 300, 400)
--            250 ->  200보다 크므로 true
-- 3. ALL : 메인쿼리의 비교조건이 서브쿼리의 검색결과와 모두 일치하면 참
--    ex )  salary > ALL (200, 300, 400)
--            250 ->  200보다는 크지만 300, 400보다는 크지 않으므로 false
-- 4. EXISTS : 메인쿼리의 비교조건이 서브쿼리의 결과 중 
--				만족하는 값이 하나라도 존재하면 참

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE DEPT_CD IN ( -- = any (이것들 중 아무거나) 와 같음
    SELECT
        DEPT_CD
    FROM TB_emp
    WHERE EMP_NM = '이관심'
    )
;

? 한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는
? 사원의 사원번호와 사원이름과 해당 사원의 한국데이터베이스진흥원에서 
? 발급한 자격증 개수를 조회
-- 답 1.
SELECT
    E.emp_no,
    E.emp_nm,
    COUNT(S.certi_cd) "자격증 개수"
FROM tb_emp E
INNER JOIN tb_emp_certi S
ON E.emp_no = S.emp_no
WHERE S.certi_cd IN (
                        SELECT certi_cd
                        FROM tb_certi
                        WHERE issue_insti_nm = '한국데이터베이스진흥원'
)
GROUP BY E.emp_no, E.emp_nm
ORDER BY E.emp_no
;
-- 답 2.
SELECT
    E.emp_no,
    E.emp_nm,
    COUNT(S.certi_cd) "자격증 개수"
FROM tb_emp E
INNER JOIN tb_emp_certi S
ON E.emp_no = S.emp_no
WHERE S.certi_cd = ANY (
                        SELECT certi_cd
                        FROM tb_certi
                        WHERE issue_insti_nm = '한국데이터베이스진흥원'
)
GROUP BY E.emp_no, E.emp_nm
ORDER BY E.emp_no
;

SELECT
    COUNT(DISTINCT EMP_NO || EMP_NM) -- COUNT개수(DISTINCT중복제거 A || B A와B붙이기)
FROM TB_EMP;

-- EXISTS문 : 메인쿼리의 비교조건이 서브쿼리의 결과 중 
--           만족하는 값이 하나라도 존재하면 참

-- 주소가 강남인 직원들이 근무하고 있는 부서정보를 조회 (부서코드, 부서명)
SELECT
    DEPT_CD,
    DEPT_NM
FROM TB_DEPT
WHERE DEPT_CD IN(100009, 100010)
;

SELECT
    DEPT_CD, EMP_NM, ADDR
FROM TB_EMP
WHERE ADDR LIKE '%강남%'
;

SELECT
    DEPT_CD,
    DEPT_NM
FROM TB_DEPT
WHERE DEPT_CD IN(
                SELECT
                    DEPT_CD, EMP_NM, ADDR
                FROM TB_EMP
                WHERE ADDR LIKE '%강남%'
                );
                
SELECT
    DEPT_CD,
    DEPT_NM
FROM TB_DEPT D --2
WHERE EXISTS(
            SELECT
                D.DEPT_CD, EMP_NM, ADDR
                -- 아무거나 작성해도됨. 1써도 되고 *써도 됨.
                -- 이 예시에서 중요한 건 WHERE 안의 조건이 FROM에 일치하는 것을 찾는 것.
            FROM TB_EMP E
            WHERE ADDR LIKE '%강남%' -- 1
                AND D.DEPT_CD = E.DEPT_CD
            );

SELECT
    COUNT(0) -- COUNT는 
FROM TB_EMP;

-- # 다중 컬럼 서브쿼리
--  : 서브쿼리의 조회 컬럼이 2개 이상인 서브쿼리

-- 부서원이 2명 이상인 부서 중에서 각 부서의 
-- 가장 연장자의 사번과 이름 생년월일과 부서코드를 조회

SELECT 
    A.emp_no, A.emp_nm, A.birth_de, A.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN (
                        SELECT 
                            dept_cd, MIN(birth_de)
                        FROM tb_emp
                        GROUP BY dept_cd
                        HAVING COUNT(*) >= 2
                    )
ORDER BY A.emp_no
;

-- 인라인 뷰 서브쿼리
-- FROM절에 쓰는 서브쿼리

-- 각 사원의 사번, 이름과 평균급여정보를 알고 싶다.

-- 이 코드를 바꿔보겠다.
SELECT 
    A.emp_no, A.emp_nm, B.pay_avg
FROM tb_emp A JOIN (
                 SELECT 
                    emp_no, AVG(pay_amt) AS pay_avg
                 FROM tb_sal_his
                 GROUP BY emp_no
                    ) B
ON A.emp_no = B.emp_no
ORDER BY A.emp_no
;

SELECT
    E.EMP_NO,
    E.EMP_NM,
    AVG(S.PAY_AMT)
FROM TB_EMP E
JOIN TB_SAL_HIS S -- 조건 결과가 900몇개나오기 때문에 QUERY()로 조건 결과를 줄여주는 게 좋다.
ON E.EMP_NO = S.EMP_NO
GROUP BY E.EMP_NO, E.EMP_NM
ORDER BY E.EMP_NO
;
-- FROM절이나 JOIN에 SUBQUERY 쓰는 것을 인라인 뷰 서브쿼리라고 한다.

SELECT 
    A.emp_no, A.emp_nm, AVG(B.PAY_AMT)
FROM tb_emp A 
JOIN TB_SAL_HIS B
ON A.emp_no = B.emp_no
GROUP BY A.EMP_NO, A.EMP_NM 
ORDER BY A.emp_no
;

-- 스칼라 서브쿼리 (SELECT, INSERT, UPDATE절에 쓰는 서브쿼리)

-- 사원의 사번, 사원명, 부서명, 생년월일, 성별코드를 조회
SELECT
    E.EMP_NO,
    E.EMP_NM,
    D.DEPT_NM, -- 이 결과 하나를 얻기 위해 JOIN을 하기엔 성능이 안좋다.
    E.BIRTH_DE,
    E.SEX_CD
FROM TB_EMP E, TB_DEPT D
WHERE E.DEPT_CD = D.DEPT_CD
;

SELECT 
    A.emp_no
    , A.emp_nm
    , (SELECT B.dept_nm FROM tb_dept B WHERE A.dept_cd = B.dept_cd) AS dept_nm
    , A.birth_de
    , A.sex_cd
FROM tb_emp A
;


SELECT 
    emp_nm, null
FROM tb_emp;






