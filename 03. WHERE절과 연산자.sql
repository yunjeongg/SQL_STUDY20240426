
-- WHERE ������
-- ��ȸ ���� ����
SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    SEX_CD
FROM TB_EMP
WHERE SEX_CD = 2; -- ���� => �����ڵ� 2 (����) �� ��ȸ

-- PK�� ���͸��� �ϸ� ������ 1�� ���ϰ� ��ȸ�ȴ�.
-- ���¹�ȣ, ������ �� ��� 0��
SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    SEX_CD
FROM TB_EMP
WHERE EMP_NO = 1000000003; -- ���� => �����ȣ ��ȸ


-- �񱳿�����
SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    SEX_CD
FROM TB_EMP
WHERE SEX_CD != 2; -- ���� => 2�� �ƴѰ��

SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    SEX_CD
FROM TB_EMP
WHERE SEX_CD <> 2; -- ���� => 2�� �ƴѰ��

SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    birth_de
FROM TB_EMP
WHERE birth_de >= '19900101'; -- ���� => 1990�� ���� �����

SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    birth_de
FROM TB_EMP
WHERE birth_de >= '19800101' -- ���� => 1980������ ��ȸ
    AND BIRTH_DE <= '19891231';
    
SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    birth_de
FROM TB_EMP
WHERE NOT birth_de >= '19800101'; -- ���� => 1980�� ���� �����


-- BETWEEN ������ ( BETWEEN A AND B, A�̻� B����)
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'; -- ���� => 1990���

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'; -- ���� => 1990����� �ƴѰ��


-- IN ���� : OR ����
SELECT
    EMP_NO,
    EMP_NM,
    DEPT_CD
FROM TB_EMP
WHERE DEPT_CD = 100002 -- ���� => �μ���ȣ�� 100002 �Ǵ� 100007 �� ���
    OR DEPT_CD = 100007 

SELECT
    EMP_NO,
    EMP_NM,
    DEPT_CD
FROM TB_EMP
WHERE DEPT_CD IN (100002, 100007,100008); -- ���� => �μ���ȣ�� 100002,100007,100008�� ���

SELECT
    EMP_NO,
    EMP_NM,
    DEPT_CD
FROM TB_EMP
WHERE DEPT_CD NOT IN (100002, 100007,100008);-- ���� => �μ���ȣ�� 100002,100007,100008 �� �ƴѰ��


-- LIKE
-- �˻����� ���
-- ���ϵ�ī�� ���� ( %: 0���� �̻�, _: ��1���� )
SELECT
    EMP_NO,
    EMP_NM,
    ADDR
FROM TB_EMP
WHERE ADDR LIKE '%����%'; -- ���� => ��ȸ���ǿ� ������ ���Ե� ���, 
-- %���ڿ�% - ���ڿ� �յڿ� ����ڰ� �͵� ��.

SELECT
    EMP_NO,
    EMP_NM,
    ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '��%'; -- ���� => ���� �̾��� ���
-- ���ڿ�% - ���ڿ� �ڿ� ����ڰ� �͵� ��.

SELECT
    EMP_NO,
    EMP_NM,
    ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '��_'; -- ���� => ���� �̾��� ���
-- ���ڿ�_ ���ڿ� �ڿ� ������ �� 1���� ���� ���.

SELECT
    EMP_NO,
    EMP_NM,
    ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '%��'; -- ���� => �̸��� ������ ������ ���
-- %���ڿ� - ���ڿ� �ڿ� ����ڰ� �͵� ��.

SELECT
    EMAIL
FROM user
WHERE EMAIL LIKE '_A%@%'; -- ���� => �̸��� �ι�°���ڰ� A�̰�, �̸��Ͽ� @�� ���� ���
-- ���ϵ�ī�� ���� ���յ� ����


-- ������ �达�̸鼭
-- �μ��� 100003, 100004 �� �ϳ��̸鼭
-- 90������ �����
-- ���, �̸�, ����, �μ��ڵ带 ��ȸ
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE,
    DEPT_CD
FROM TB_EMP
WHERE 1 = 1 -- ������ �����鼭(�´����� �ƹ��ų� ��, �ּ�ó���ϱ����ϰ� �ϱ����� �뵵)
    AND EMP_NM LIKE '��%'
    AND DEPT_CD IN (100003, 100004)
    AND BIRTH_DE BETWEEN '19900101' AND '19991231';
    
    
-- NULL�� ��ȸ (�����ؾ���, ���迡�� ���ֳ���)
-- �ݵ�� IS NULL�� ��ȸ�� ��!
SELECT
    EMP_NO,
    EMP_NM,
    direct_manager_emp_no -- ���ӻ�� ��ȸ
FROM TB_EMP;

SELECT
    EMP_NO,
    EMP_NM,
    direct_manager_emp_no -- ���ӻ�� ��ȸ
FROM TB_EMP
WHERE direct_manager_emp_no IS NULL; 
-- NULL�� ��ȸ�Ҷ��� �׻� IS NULL�� �ؾ� ��

SELECT
    EMP_NO,
    EMP_NM,
    direct_manager_emp_no -- ���ӻ�� ��ȸ
FROM TB_EMP
WHERE direct_manager_emp_no IS NOT NULL; 
-- �ٸ������� NOT�� ���϶� �տ��������� NULL�� IS�ڿ�����.


-- ������ �켱 ����
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '��%'
	AND ADDR LIKE '%����%' 
    OR ADDR LIKE '%�ϻ�%'
    -- ������ �켱 ������ ���� 
    -- �达�̸鼭 ������¾�, �Ǵ� �ϻ��¾� �� ����
;

SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '��%'
	AND (ADDR LIKE '%����%' 
    OR ADDR LIKE '%�ϻ�%')
    -- ()�� �켱������ �� ũ�� ������
    -- �达�̸鼭 ���� �Ǵ� �ϻ��¾� �� ����
;

--NULL ������ ����� NULL
--NULL + 3 = NULL;
--NULL * 15 = NULL;

    
