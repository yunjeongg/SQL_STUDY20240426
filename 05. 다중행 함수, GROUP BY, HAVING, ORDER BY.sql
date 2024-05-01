
SELECT
    *
FROM TB_SAL_HIS;

-- ���� �Լ� (������ �Լ�)
-- ���� ���� ��� �ѹ��� �Լ��� ����

SELECT
    COUNT(*)
FROM TB_SAL_HIS;

SELECT
    SUBSTR(EMP_NM, 1, 1)
FROM TB_EMP;

SELECT
    COUNT(*) "����Ƚ��",
    SUM(PAY_AMT) "�����Ѿ�",
    AVG(PAY_AMT) "��� ���޾�",
    MAX(PAY_AMT) "�ִ� ���޾�",
    MIN(PAY_AMT) "�ּ� ���޾�"
FROM TB_SAL_HIS;

// *�� ������ �� �� �Ǽ��� ����
SELECT
    * -- �� 41��
FROM TB_EMP;

SELECT
    COUNT(*) -- �� 41��, ��ȸ�� Ƚ�� ���� �Լ�
FROM TB_EMP;

SELECT
    EMP_NM
FROM TB_EMP;

SELECT
    COUNT(EMP_NM)
FROM TB_EMP
WHERE EMP_NM LIKE '��%';

-- �����Լ��� ������ �� NULL�� ���� ��ȸ
SELECT
    COUNT(DIRECT_MANAGER_EMP_NO) -- �� 40��
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

-- ȸ�� ��ü
SELECT
    COUNT(EMP_NO) "�� �����",
    MIN(BIRTH_DE) "�ֿ����� ����", -- ������ ���� �۴� = �������ϸ���
    MAX(BIRTH_DE) "�ֿ����� ����"
FROM TB_EMP;


-- �μ� ��
-- �μ��� ��� ���� ����ΰ�?
-- �μ����� �ֿ������� ������ �����ΰ�?

-- GROUP BY : ������ �÷����� �ұ׷�ȭ �� ��
-- �� �׷캰�� �����Լ��� ���� ����
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE,
    DEPT_CD
FROM TB_EMP
ORDER BY DEPT_CD;

SELECT
    COUNT(*) "�μ��� �����",
    MIN(BIRTH_DE) "�μ��� �ֿ����� ����"
FROM TB_EMP
GROUP BY DEPT_CD;

SELECT
    EMP_NO "�����ȣ", -- �����ȣ ��
    TO_CHAR(SUM(PAY_AMT),'L999,999,999')"����� �ѱ޿���", -- �� ���� �޿���
    TO_CHAR(ROUND(AVG(PAY_AMT), 2),'L999,999,999.99')"����� ��ձ޿���", -- ��� �޿���
    TO_CHAR(MAX(PAY_AMT),'L999,999,999')"����� �ְ�޿���", -- ���� ���� ���� ���� �޿�
    COUNT(PAY_DE)"�޿�����Ƚ��" -- �޿� ���� Ƚ��
FROM TB_sal_his
group by emp_no
order by emp_no;

SELECT
    EMP_NO
FROM TB_EMP; // 41�� ��ȸ�ϰ�

SELECT
    COUNT(*)
FROM TB_EMP; // 1�� ��ȸ�ϱ⿡

-- ��ȸ ������ �޶����⿡ ��ȸ�� �Ϲݰ� �׷��Լ��� ���� ��� �Ұ�
-- ���� ��ȸ�ؾ���

-- GROUP BY ���� ����� �÷���
-- SELECT���� �׷��Լ��� ���� ��ȸ ����
SELECT
    SEX_CD,
    COUNT(*)
FROM TB_EMP
GROUP BY SEX_CD;

SELECT
    DEPT_CD, -- �μ���ȸ
    SEX_CD, -- ������ȸ
    COUNT(*), -- ���
    MAX(BIRTH_DE) -- ���� �����
FROM TB_EMP
GROUP BY DEPT_CD, SEX_CD -- �׷�,����
ORDER BY DEPT_CD;

-- ������� 2019�⿡ �޿� ��վ�,
-- �ּ����޾�, �ִ����޾� ��ȸ

-- WHERE : �����ϱ� ���� ���͸��ϰ���� ��
SELECT
    EMP_NO "�����ȣ", -- �����ȣ ��
    TO_CHAR(SUM(PAY_AMT),'L999,999,999')"����� �ѱ޿���", -- �� ���� �޿���
    TO_CHAR(ROUND(AVG(PAY_AMT), 2),'L999,999,999.99')"����� ��ձ޿���", -- ��� �޿���
    TO_CHAR(MAX(PAY_AMT),'L999,999,999')"����� �ְ�޿���", -- ���� ���� ���� ���� �޿�
    COUNT(PAY_DE)"�޿�����Ƚ��" -- �޿� ���� Ƚ��
FROM TB_sal_his
WHERE PAY_DE BETWEEN '20190101' AND '20191231' -- 2019�⿡ ������
group by EMP_NO
order by EMP_NO;

-- HAVING : ������ �� ���͸��ϰ���� ��
SELECT
    EMP_NO "�����ȣ", -- �����ȣ ��
    TO_CHAR(SUM(PAY_AMT),'L999,999,999')"����� �ѱ޿���", -- �� ���� �޿���
    TO_CHAR(ROUND(AVG(PAY_AMT), 2),'L999,999,999.99')"����� ��ձ޿���", -- ��� �޿���
    TO_CHAR(MAX(PAY_AMT),'L999,999,999')"����� �ְ�޿���", -- ���� ���� ���� ���� �޿�
    COUNT(PAY_DE)"�޿�����Ƚ��" -- �޿� ���� Ƚ��
FROM TB_sal_his
WHERE PAY_DE BETWEEN '20190101' AND '20191231' -- 1. 2019�⿡ ������ �޿���
group by EMP_NO
HAVING AVG(PAY_AMT) >= 4000000 2. �޿��� 400���� �̻��� ��
order by EMP_NO;

-- �μ����� ���� ������ �������, �������� �������, �μ��� �� ��� ���� ��ȸ
-- �׷��� �μ��� ����� 1���� �μ��� ������ ��ȸ�ϰ� ���� ����.
SELECT
    DEPT_CD,
    MAX(BIRTH_DE),
    MIN(BIRTH_DE),
    COUNT(*)
FROM TB_EMP
GROUP BY DEPT_CD
HAVING COUNT(*) > 1
ORDER BY DEPT_CD;

-- SELECT ���� ���� ����
-- FROM ~�κ��� WHERE ~���������� GROUP BY ���� HAVING ���������� SELECT ��ȸ ORDERBY ����


-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no -- �ƹ��͵� ������������ �⺻�� ��������ASC
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
    emp_no AS ���
    , emp_nm AS �̸� -- �̷������� ��Ī�� �����صΰ�
    , addr AS �ּ�
FROM tb_emp
ORDER BY �̸� DESC -- ��Ī���� ����� ������ �͵� ������.
;

SELECT 
    emp_no  --1
    , emp_nm --2
    , dept_cd --3 �Ϲ������� �̷������� ��ȣ�� �ְ�
FROM tb_emp
ORDER BY 3 ASC, 1 DESC --�Ϲ��� ��ȣ�� ����� ������ �͵� �����ϴ�.
;


SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC -- �Ϲ�������, �÷�, ��Ī �� ȥ�� �����ϴ�.
;

SELECT emp_no AS ���, emp_nm AS �̸�, addr AS �ּ�
FROM tb_emp
ORDER BY �̸�, 1 DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) ����
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


-- ������� 2019�� ����� ���ɾ��� 450���� �̻��� ����� �����ȣ�� 2019�� ���� ��ȸ
SELECT 
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC -- �̷������� �����Լ��� ����� ������ �͵� �����ϴ�.
;

SELECT
    emp_nm,
    direct_manager_emp_no
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC; 
-- ����Ŭ������ NULL�� ���� ũ�� �ٸ� DB������ NULL�� ���� ���� ��쵵 �ִ�.
-- �� �ٸ� �� �ִ�.






