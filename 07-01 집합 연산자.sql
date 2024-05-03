
-- ���� ������
-- ## UNION
-- 1. ������ ������ �ǹ��Դϴ�. (1.2.3, 3.4.5 -> 12345
-- 2. ù��° ������ �ι�° ������ �ߺ������� �ѹ��� �����ݴϴ�.
-- 3. ù��° ������ ���� ������ Ÿ���� �ι�° ������ ������ Ÿ�԰� �����ؾ� ��.
-- 4. �ڵ����� ������ �Ͼ (ù��° �÷� �������� �⺻��)
-- 5. ���ɻ� ���ϰ� �Ͼ �� ����

-- ���η� �ϸ� JOIN, ���η� �ϸ� ���տ�����.

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231';

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE,
    ADDR -- ù ��° ���̺��� 4����ȸ��
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE -- �� ��° ���̺��� 3����ȸ
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231';
-- ��������. ��ȸ�ϴ� �÷��� ������ �¾ƾ� �ϰ�

SELECT
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION -- (������ ���м����̾��� �����ȣ�� ������� �̸��� ������ �Ȱ��� �̰����� 2->1�� ��)
SELECT
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231';


-- ## UNION ALL
-- 1. UNION�� ���� �� ���̺�� �������� ���ļ� �����ݴϴ�.
-- 2. UNION���� �޸� �ߺ��� �����͵� �ѹ� �� �����ݴϴ�.
-- 3. �ڵ� ���� ����� �������� �ʾ� ���ɻ� �����մϴ�.

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION ALL
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231';

SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION ALL -- �ߺ����ž��� ��ħ. (�̰����� 2)
SELECT
    EMP_NO,
    EMP_NM,
    BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231'; 

SELECT
    EMP_NO EN1,  -- �� ��ο��� ��Ī�� ������
    BIRTH_DE BD1 -- �����ִ� ���̺��� ��Ī�� ��
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'
UNION ALL -- �ߺ����ž��� ��ħ. (�̰����� 2)
SELECT
    EMP_NO EN2,
    BIRTH_DE BD2
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '19791231'; 


-- ## INTERSECT
-- 1. ù��° ������ �ι�° �������� �ߺ��� �ุ�� ����մϴ�.
-- 2. �������� �ǹ��Դϴ�.
SELECT  -- ����� �ڰ��� ��� ����
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE C.certi_nm = 'SQLD' -- ��� �� SQLD�� ���
INTERSECT
SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%����%'; -- ���ο� ��� ������� �� �ڰ���


SELECT 
    A.emp_no, A.emp_nm, A.addr
    , B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
JOIN tb_certi C 
ON B.certi_cd = C.certi_cd 
WHERE A.addr LIKE '%����%'
    AND C.certi_nm = 'SQLD'
;

-- ## MINUS(EXCEPT) ����Ŭ���� ���(SQL���� ���) 
-- 1. �ι�° �������� ���� ù��° �������� �ִ� �����͸� �����ݴϴ�.
-- 2. �������� �����Դϴ�. (1.2.3, 3.4.5 -> 

SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100001'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE dept_cd = '100004'
MINUS
SELECT emp_no, emp_nm, sex_cd, dept_cd FROM tb_emp WHERE sex_cd = '1'
;

-- ���տ����ڿ��� ORDER BY �� �� �������� �ѹ��� ���� �� �ִ�.




