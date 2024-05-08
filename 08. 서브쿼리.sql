-- ������ ���� 
-- START WITH : ������ ù �ܰ踦 ��� ������ �������� ���� ����
-- CONNECT BY PRIOR �ڽ� = �θ�  -> ������ Ž��
-- CONNECT BY �ڽ� = PRIOR �θ�  -> ������ Ž��
-- ORDER SIBLINGS BY : ���� ���������� ������ ����.
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
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


-- ���Ľ� �� �θ� ���� �ڽĵ鵵 ���� �� �������� ���� �ö󰣴�.

-- # �������� : SQL �ȿ� SQL�� ���Ե� ����
-- ## ������ �������� : ��ȸ ����� 1�� ����
-- �μ��ڵ尡 100004���� �μ��� ����� ���� ��ȸ
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE DEPT_CD = '100004'
;

-- Quiz 01. �̳��� ���� �μ��� ��� ������� ��ȸ
-- �̳���� �μ��ڵ尡 ����ϱ�?
-- �� �μ��ڵ�� ��� ����� ��ȸ�ϱ�
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE DEPT_CD = (
    SELECT
        DEPT_CD
    FROM TB_emp
    WHERE EMP_NM = '�̳���' -- ()��� �̳����� �μ��ڵ� 100004�� ���� -> Subquery
    )
;

-- ����̸��� �̰����� ����� ���� �ִ� �μ��� ������� ��ȸ
-- ������ �񱳿�����(=, <>, >, >=, <, <=)�� ������ ���������θ� ���ؾ� ��.
? �߱��� �ڰ��� ������ ��ȸ
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE DEPT_CD = (
    SELECT
        DEPT_CD
    FROM TB_emp
    WHERE EMP_NM = '�̰���' -- ����� 2���� �����࿡���� ������.
;
-- 20200525�� ���� �޿��� ȸ����ü�� 20200525�� 
-- ��ü ��� �޿����� ���� ������� ����(���, �̸�, �޿�������, �����޿��׼�) ��ȸ
-- ȸ����ü 20200525 ��ձ޿� ���
-- �� ��պ��� ���� ��� ��ȸ
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

-- 20200525 ȸ����ü �޿����
SELECT
    AVG(PAY_AMT)
FROM TB_SAL_HIS
WHERE PAY_DE = '20200525';

-- # ������ ��������
-- ���������� ��ȸ �Ǽ��� 0�� �̻��� ��
-- ## ������ ������
-- 1. IN : ���������� �������� �������� ����߿� �ϳ��� ��ġ�ϸ� ��
--    ex )  salary IN (200, 300, 400)
--            250 ->  200, 300, 400 �߿� �����Ƿ� false
-- 2. ANY, SOME : ���������� �������� ���������� �˻���� �� �ϳ� �̻� ��ġ�ϸ� ��
--    ex )  salary > ANY (200, 300, 400)
--            250 ->  200���� ũ�Ƿ� true
-- 3. ALL : ���������� �������� ���������� �˻������ ��� ��ġ�ϸ� ��
--    ex )  salary > ALL (200, 300, 400)
--            250 ->  200���ٴ� ũ���� 300, 400���ٴ� ũ�� �����Ƿ� false
-- 4. EXISTS : ���������� �������� ���������� ��� �� 
--				�����ϴ� ���� �ϳ��� �����ϸ� ��

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE DEPT_CD IN ( -- = any (�̰͵� �� �ƹ��ų�) �� ����
    SELECT
        DEPT_CD
    FROM TB_emp
    WHERE EMP_NM = '�̰���'
    )
;

? �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ�
? ����� �����ȣ�� ����̸��� �ش� ����� �ѱ������ͺ��̽���������� 
? �߱��� �ڰ��� ������ ��ȸ
-- �� 1.
SELECT
    E.emp_no,
    E.emp_nm,
    COUNT(S.certi_cd) "�ڰ��� ����"
FROM tb_emp E
INNER JOIN tb_emp_certi S
ON E.emp_no = S.emp_no
WHERE S.certi_cd IN (
                        SELECT certi_cd
                        FROM tb_certi
                        WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
GROUP BY E.emp_no, E.emp_nm
ORDER BY E.emp_no
;
-- �� 2.
SELECT
    E.emp_no,
    E.emp_nm,
    COUNT(S.certi_cd) "�ڰ��� ����"
FROM tb_emp E
INNER JOIN tb_emp_certi S
ON E.emp_no = S.emp_no
WHERE S.certi_cd = ANY (
                        SELECT certi_cd
                        FROM tb_certi
                        WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
GROUP BY E.emp_no, E.emp_nm
ORDER BY E.emp_no
;

SELECT
    COUNT(DISTINCT EMP_NO || EMP_NM) -- COUNT����(DISTINCT�ߺ����� A || B A��B���̱�)
FROM TB_EMP;

-- EXISTS�� : ���������� �������� ���������� ��� �� 
--           �����ϴ� ���� �ϳ��� �����ϸ� ��

-- �ּҰ� ������ �������� �ٹ��ϰ� �ִ� �μ������� ��ȸ (�μ��ڵ�, �μ���)
SELECT
    DEPT_CD,
    DEPT_NM
FROM TB_DEPT
WHERE DEPT_CD IN(100009, 100010)
;

SELECT
    DEPT_CD, EMP_NM, ADDR
FROM TB_EMP
WHERE ADDR LIKE '%����%'
;

SELECT
    DEPT_CD,
    DEPT_NM
FROM TB_DEPT
WHERE DEPT_CD IN(
                SELECT
                    DEPT_CD, EMP_NM, ADDR
                FROM TB_EMP
                WHERE ADDR LIKE '%����%'
                );
                
SELECT
    DEPT_CD,
    DEPT_NM
FROM TB_DEPT D --2
WHERE EXISTS(
            SELECT
                D.DEPT_CD, EMP_NM, ADDR
                -- �ƹ��ų� �ۼ��ص���. 1�ᵵ �ǰ� *�ᵵ ��.
                -- �� ���ÿ��� �߿��� �� WHERE ���� ������ FROM�� ��ġ�ϴ� ���� ã�� ��.
            FROM TB_EMP E
            WHERE ADDR LIKE '%����%' -- 1
                AND D.DEPT_CD = E.DEPT_CD
            );

SELECT
    COUNT(0) -- COUNT�� 
FROM TB_EMP;

-- # ���� �÷� ��������
--  : ���������� ��ȸ �÷��� 2�� �̻��� ��������

-- �μ����� 2�� �̻��� �μ� �߿��� �� �μ��� 
-- ���� �������� ����� �̸� ������ϰ� �μ��ڵ带 ��ȸ

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

-- �ζ��� �� ��������
-- FROM���� ���� ��������

-- �� ����� ���, �̸��� ��ձ޿������� �˰� �ʹ�.

-- �� �ڵ带 �ٲ㺸�ڴ�.
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
JOIN TB_SAL_HIS S -- ���� ����� 900������� ������ QUERY()�� ���� ����� �ٿ��ִ� �� ����.
ON E.EMP_NO = S.EMP_NO
GROUP BY E.EMP_NO, E.EMP_NM
ORDER BY E.EMP_NO
;
-- FROM���̳� JOIN�� SUBQUERY ���� ���� �ζ��� �� ����������� �Ѵ�.

SELECT 
    A.emp_no, A.emp_nm, AVG(B.PAY_AMT)
FROM tb_emp A 
JOIN TB_SAL_HIS B
ON A.emp_no = B.emp_no
GROUP BY A.EMP_NO, A.EMP_NM 
ORDER BY A.emp_no
;

-- ��Į�� �������� (SELECT, INSERT, UPDATE���� ���� ��������)

-- ����� ���, �����, �μ���, �������, �����ڵ带 ��ȸ
SELECT
    E.EMP_NO,
    E.EMP_NM,
    D.DEPT_NM, -- �� ��� �ϳ��� ��� ���� JOIN�� �ϱ⿣ ������ ������.
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






