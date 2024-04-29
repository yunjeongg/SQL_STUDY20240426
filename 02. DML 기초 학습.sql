CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    reg_date DATE
);

-- INSERT
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES 
    (1, '선풍기', 120000, SYSDATE);
    
    
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES 
    (2, '세탁기', 2000000, SYSDATE);    
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES 
    (3, '달고나', SYSDATE);   
    
INSERT INTO goods
    (id, goods_name)
VALUES 
    (4, '계란');  
    
INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES 
    ('점퍼', 5, SYSDATE, '49000');  

-- 컬럼명 생략시 테이블구조 순서대로 자동 기입
INSERT INTO goods
    
VALUES 
    (6, '냉장고', 1000000, SYSDATE); 
    
  



-- UPDATE

UPDATE goods
SET goods_name = '에어컨'
WHERE id = 1
;

UPDATE goods
SET price = 9999;

UPDATE tbl_user
SET age = age + 1;

UPDATE goods
SET id = 11
WHERE id = 4;

UPDATE goods
SET goods_name = null
WHERE id = 3;

UPDATE goods
SET price = null
WHERE id = 3;

UPDATE goods
SET goods_name = '청바지', 
    price = 299000
WHERE id = 3;

-- DELETE

DELETE FROM goods
WHERE id = 11;

-- 조건 없이 delete하면 전체삭제됨
-- 다만 이 문법은 복구가 가능함
DELETE FROM goods;
TRUNCATE TABLE goods; -- 복구 불가
DROP TABLE goods;



SELECT * FROM goods;  

-- SELECT 기본
SELECT
    CERTI_CD, 
    CERTI_NM, 
    ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT -- 컬럼 순서 바꾸는 것도 상관없음, 조회하고 싶지 않은 컬럼은 빼도 됨
    CERTI_NM,
    ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT DISTINCT -- 컬럼의 내용 중 중복제거
    ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT ALL -- 컬럼의 내용 모두보기 (생략가능, 안쓰면 자동으로 반영됨)
    ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT
    * -- 모든 컬럼 조회 (권장안함, 컬럼의 순서 바꿀 수 없음)
FROM TB_CERTI;

-- 열 별칭 부여 ( 헤더명 변경하기)
SELECT
    EMP_NM AS "사원명",
    ADDR AS "주소"
FROM TB_EMP;

SELECT
    EMP_NM "사원명", -- AS생략가능
    ADDR "주소"
FROM TB_EMP;

SELECT
    EMP_NM 사원명, -- 쌍따옴표 생략가능
    ADDR 주소
FROM TB_EMP;

SELECT
    EMP_NM AS "사원명",
    ADDR AS "거주지 주소" -- 단 띄어쓰기가 있다면 쌍따옴표 써줘야함
FROM TB_EMP;

-- 문자열 결합하기
SELECT
-- 컬럼 내용 앞에 특정문자열 붙이고싶다면 '문자열' ||
-- 단 컬럼 헤더까지 같이 바뀜
    '자격증: ' || CERTI_NM
FROM TB_CERTI;

SELECT
-- 컬럼 헤더 바꾸기, 컬럼 내용앞에 특정문자열 붙이기 같이써주는게 좋다.
    '자격증: ' || CERTI_NM AS "자격증 정보"
FROM TB_CERTI;

SELECT
    certi_nm || ' (' || issue_insti_nm || ')' AS "자격증"
FROM tb_certi;
    
    


    

    