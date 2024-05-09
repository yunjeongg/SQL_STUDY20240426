-- 트랜잭션

-- 테이블 추가
CREATE TABLE STUDENT (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    AGE NUMBER
);

-- 행 추가
INSERT INTO STUDENT VALUES(1, '김철수', 15);
INSERT INTO STUDENT VALUES(2, '홍길동', 16);

-- 전체 검색
SELECT * FROM STUDENT;

-- COMMIT을 하지 않으면 DB에 저장이 되지 않음.
COMMIT;

INSERT INTO STUDENT VALUES(3, '도우너', 12);

-- COMMIT 안한 상태에서는 INSERT 한 것 언제든지 취소 가능
ROLLBACK; -- 도우너는 COMMIT 하지 않았기 때문에 취소됨.

-- 계좌이체

-- 김철수가 5000 받았다.
UPDATE TB_ACCOUNT
SET BALANCE = BALANCE + 5000
WHERE NAME = '김철수';

-- 박영희가 5000 줬다.
UPDATE TB_ACCOUNT
SET BALANCE = BALANCE - 5000
WHERE NAME = '박영희';

-- 김철수가 5000받은 것과, 박영희가 5000 준 것은 한 세트이므로 
-- COMMIT할 때는 한 세트의가 끝난 후 해줘야 한다.
COMMIT 

-- 취소를 할 때도 한세트끼리 취소해야한다.
DELETE FROM STUDENT;
ROLLBACK;

-- 전체 검색
SELECT * FROM STUDENT;

-- TRUNCATE 로 지운 내용은 다시 돌아오지 않음. ROLLBACK 해도 돌아오지 않음.
TRUNCATE TABLE STUDENT;












