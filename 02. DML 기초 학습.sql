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
    (1, '��ǳ��', 120000, SYSDATE);
    
    
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES 
    (2, '��Ź��', 2000000, SYSDATE);    
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES 
    (3, '�ް�', SYSDATE);   
    
INSERT INTO goods
    (id, goods_name)
VALUES 
    (4, '���');  
    
INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES 
    ('����', 5, SYSDATE, '49000');  

-- �÷��� ������ ���̺��� ������� �ڵ� ����
INSERT INTO goods
    
VALUES 
    (6, '�����', 1000000, SYSDATE); 
    
  



-- UPDATE

UPDATE goods
SET goods_name = '������'
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
SET goods_name = 'û����', 
    price = 299000
WHERE id = 3;

-- DELETE

DELETE FROM goods
WHERE id = 11;

-- ���� ���� delete�ϸ� ��ü������
-- �ٸ� �� ������ ������ ������
DELETE FROM goods;
TRUNCATE TABLE goods; -- ���� �Ұ�
DROP TABLE goods;



SELECT * FROM goods;  

-- SELECT �⺻
SELECT
    CERTI_CD, 
    CERTI_NM, 
    ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT -- �÷� ���� �ٲٴ� �͵� �������, ��ȸ�ϰ� ���� ���� �÷��� ���� ��
    CERTI_NM,
    ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT DISTINCT -- �÷��� ���� �� �ߺ�����
    ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT ALL -- �÷��� ���� ��κ��� (��������, �Ⱦ��� �ڵ����� �ݿ���)
    ISSUE_INSTI_NM
FROM TB_CERTI;

SELECT
    * -- ��� �÷� ��ȸ (�������, �÷��� ���� �ٲ� �� ����)
FROM TB_CERTI;

-- �� ��Ī �ο� ( ����� �����ϱ�)
SELECT
    EMP_NM AS "�����",
    ADDR AS "�ּ�"
FROM TB_EMP;

SELECT
    EMP_NM "�����", -- AS��������
    ADDR "�ּ�"
FROM TB_EMP;

SELECT
    EMP_NM �����, -- �ֵ���ǥ ��������
    ADDR �ּ�
FROM TB_EMP;

SELECT
    EMP_NM AS "�����",
    ADDR AS "������ �ּ�" -- �� ���Ⱑ �ִٸ� �ֵ���ǥ �������
FROM TB_EMP;

-- ���ڿ� �����ϱ�
SELECT
-- �÷� ���� �տ� Ư�����ڿ� ���̰�ʹٸ� '���ڿ�' ||
-- �� �÷� ������� ���� �ٲ�
    '�ڰ���: ' || CERTI_NM
FROM TB_CERTI;

SELECT
-- �÷� ��� �ٲٱ�, �÷� ����տ� Ư�����ڿ� ���̱� ���̽��ִ°� ����.
    '�ڰ���: ' || CERTI_NM AS "�ڰ��� ����"
FROM TB_CERTI;

SELECT
    certi_nm || ' (' || issue_insti_nm || ')' AS "�ڰ���"
FROM tb_certi;
    
    


    

    