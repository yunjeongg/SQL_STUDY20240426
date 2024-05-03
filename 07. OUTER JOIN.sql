
-- OUTER JOIN 실습환경 세팅
INSERT INTO tb_dept VALUES ('100014', '4차산업혁명팀', '999999');
INSERT INTO tb_dept VALUES ('100015', '포스트코로나팀', '999999');
COMMIT;

SELECT * FROM tb_dept;

ALTER TABLE tb_emp DROP CONSTRAINT fk_tb_emp01;

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '이순신', '19811201', '1', '경기도 용인시 수지구 죽전1동 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '정약용', '19820402', '1', '경기도 고양시 덕양구 화정동 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '박지원', '19850611', '1', '경기도 수원시 팔달구 매탄동 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '장보고', '19870102', '1', '경기도 성남시 분당구 정자동 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '김종서', '19880824', '1', '경기도 고양시 일산서구 백석동 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;
    
 
SELECT * FROM tb_emp ORDER BY emp_no DESC;

SELECT emp_no, emp_nm, dept_cd 
FROM tb_emp ORDER BY emp_no DESC;

SELECT * FROM tb_dept;





-- 사원 명과 소속부서 명을 조회
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E
INNER JOIN TB_DEPT D -- INNER JOIN : 부서가 있는 사람들만 조회됨
ON E.DEPT_CD = D.DEPT_CD;

-- 회원정보(USER)와 회원의 주문내역(ORDER)을 조회
-- INNDER JOIN을 사용하면 회원정보와 주문내역이 1번 이상인 사람만 조회가능

-- 회원정보가 있지만 주문 1번도 하지 않은 사람을 조회하고싶을때는?
-- 이럴 때 사용하는 OUTER JOIN
-- # OUTER JOIN
-- 1. 조인 조건을 만족하지 않는 행들도 조회할 때 사용하는 조인기법입니다.
-- 2. OUTER조인 연산자 기호는 (+)기호입니다.
-- 3. INNER조인은 조인 조건을 만족하지 않으면 해당 행을 조회하지 않습니다
--   그러나 OUTER JOIN은 방향(LEFT, RIGHT, FULL)에 맞게 조건에 매칭되지 
--   않는 행들도 모두 NULL로 처리해서 조회합니다.

-- # LEFT OUTER JOIN
-- 조인되는 왼쪽 테이블은 모두 조회하고, 오른쪽 테이블은 조인조건에 매칭된 것만 조회합니다.

-- 나는 사원정보는 일단 다 보고 싶은데 혹시 부서테이블에서 부서코드가 매칭되면
-- 보너스로 부서이름도 찍어줘라
-- (게시글에 댓글이 없어도 일단 게시글 전체 조회해주세요 - OUTER JOIN)
-- (게시글에 댓글이 있는 게시글만 전체 조회 해주세요 - INNER JOIN)

-- 표준 OUTER JOIN
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E
LEFT OUTER JOIN TB_DEPT D -- OUTER JOIN은 방향이 있어야 함.
ON E.DEPT_CD = D.DEPT_CD;
-- LEFT : 왼쪽(TB.EMP E)은 다 보여주고, 오른쪽은 ON 조건에 매칭하는 것만 보여줘
-- 매칭된 것은 보여주고, 매칭 안되는 모든 데이터는 NULL로 보여줌.

SELECT
    *
FROM TB_EMP E
LEFT JOIN TB_DEPT D -- LEFT JOIN 이라고 줄여서 써도 됨.
ON E.DEPT_CD = D.DEPT_CD;

SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E, TB_DEPT D
WHERE E.DEPT_CD = D.DEPT_CD;

-- 오라클 OUTER 조인
-- LEFT : 조인조건에서 오른쪽에 (+) 를 붙임.
-- RIGHT : 왼쪽에 (+) 를 붙임
-- FULL : 지원하지 않음.
-- (+) 가 붙으면 표준조인에서 ON절에 위치하는 조건
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E, TB_DEPT D
WHERE E.DEPT_CD = D.DEPT_CD(+);


-- # RIGHT OUTER JOIN
-- 조인되는 오른쪽 테이블은 모두 조회하고, 왼쪽 테이블은 조건에 매칭된것만 조회

-- 나는 모든 부서정보를 조회하고 싶은데 혹시 부서코드가 일치하는 사원이 있으면 함께 조회해줘
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E
RIGHT OUTER JOIN TB_DEPT D 
ON E.DEPT_CD = D.DEPT_CD;
-- 오른쪽은 다 나오고 왼쪽은 매칭된 것만 나온다.

SELECT
    *
FROM TB_EMP E
RIGHT OUTER JOIN TB_DEPT D 
ON E.DEPT_CD = D.DEPT_CD;

-- 오라클 OUTER 조인
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E, TB_DEPT D 
WHERE E.DEPT_CD (+) = D.DEPT_CD;


-- #FULL OUTER JOIN
-- - 왼쪽 조인테이블, 오른쪽 조인테이블을 모두 보여주고 매칭되면 매칭데이터까지 합쳐서 보여줌

SELECT 
    A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
FROM tb_emp A
FULL OUTER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
ORDER BY A.emp_no 
;

-- 사원이 46명, 부서가 16개 일 때
-- 부서에 소속된 사원이 41명이고
-- 사원이 존재하는 부서는 14개 이다.

-- INNER JOIN 의 결과 41건
-- LEFT JOIN 의 결과 46건 (INNER JOIN 41 + 부서가 없는사원 5 = 46건)
-- RIGHT JOIN 의 결과 (INNER JOIN 41 + 사원이 없는 부서 2 = 43건)
-- FULL JOIN 의 결과(INNER JOIN 41 + LEFT 조건 5 + RIGHT 조건 2 = 48건)


-- # SELF JOIN
-- 1. 하나의 테이블에서 자기 자신의 테이블끼리 조인하는 기법입니다.
-- 2. 자기 자신 테이블에서 pk와 fk로 동등조인합니다.

-- 자기와 자기의 복제테이블끼리 조인하는 것.
SELECT 
    A.emp_no "사원번호",
    A.emp_nm "사원명",
    A.addr "사원주소",
    A.direct_manager_emp_no "직속 상사 사번",
    B.emp_nm "상사명",
    B.addr "상사주소"
FROM tb_emp A
INNER JOIN tb_emp B
ON a.direct_manager_emp_no = b.emp_no
ORDER BY A.emp_no
;

-- 양옆으로 합치면 JOIN 위아래로 합치면 집합연산자



