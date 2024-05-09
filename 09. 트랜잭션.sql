-- Ʈ�����

-- ���̺� �߰�
CREATE TABLE STUDENT (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    AGE NUMBER
);

-- �� �߰�
INSERT INTO STUDENT VALUES(1, '��ö��', 15);
INSERT INTO STUDENT VALUES(2, 'ȫ�浿', 16);

-- ��ü �˻�
SELECT * FROM STUDENT;

-- COMMIT�� ���� ������ DB�� ������ ���� ����.
COMMIT;

INSERT INTO STUDENT VALUES(3, '�����', 12);

-- COMMIT ���� ���¿����� INSERT �� �� �������� ��� ����
ROLLBACK; -- ����ʴ� COMMIT ���� �ʾұ� ������ ��ҵ�.

-- ������ü

-- ��ö���� 5000 �޾Ҵ�.
UPDATE TB_ACCOUNT
SET BALANCE = BALANCE + 5000
WHERE NAME = '��ö��';

-- �ڿ��� 5000 ���.
UPDATE TB_ACCOUNT
SET BALANCE = BALANCE - 5000
WHERE NAME = '�ڿ���';

-- ��ö���� 5000���� �Ͱ�, �ڿ��� 5000 �� ���� �� ��Ʈ�̹Ƿ� 
-- COMMIT�� ���� �� ��Ʈ�ǰ� ���� �� ����� �Ѵ�.
COMMIT 

-- ��Ҹ� �� ���� �Ѽ�Ʈ���� ����ؾ��Ѵ�.
DELETE FROM STUDENT;
ROLLBACK;

-- ��ü �˻�
SELECT * FROM STUDENT;

-- TRUNCATE �� ���� ������ �ٽ� ���ƿ��� ����. ROLLBACK �ص� ���ƿ��� ����.
TRUNCATE TABLE STUDENT;












