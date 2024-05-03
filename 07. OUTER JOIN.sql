
-- OUTER JOIN �ǽ�ȯ�� ����
INSERT INTO tb_dept VALUES ('100014', '4�����������', '999999');
INSERT INTO tb_dept VALUES ('100015', '����Ʈ�ڷγ���', '999999');
COMMIT;

SELECT * FROM tb_dept;

ALTER TABLE tb_emp DROP CONSTRAINT fk_tb_emp01;

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '�̼���', '19811201', '1', '��⵵ ���ν� ������ ����1�� 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '�����', '19820402', '1', '��⵵ ���� ���籸 ȭ���� 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '������', '19850611', '1', '��⵵ ������ �ȴޱ� ��ź�� 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '�庸��', '19870102', '1', '��⵵ ������ �д籸 ���ڵ� 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '������', '19880824', '1', '��⵵ ���� �ϻ꼭�� �鼮�� 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;
    
 
SELECT * FROM tb_emp ORDER BY emp_no DESC;

SELECT emp_no, emp_nm, dept_cd 
FROM tb_emp ORDER BY emp_no DESC;

SELECT * FROM tb_dept;





-- ��� ��� �ҼӺμ� ���� ��ȸ
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E
INNER JOIN TB_DEPT D -- INNER JOIN : �μ��� �ִ� ����鸸 ��ȸ��
ON E.DEPT_CD = D.DEPT_CD;

-- ȸ������(USER)�� ȸ���� �ֹ�����(ORDER)�� ��ȸ
-- INNDER JOIN�� ����ϸ� ȸ�������� �ֹ������� 1�� �̻��� ����� ��ȸ����

-- ȸ�������� ������ �ֹ� 1���� ���� ���� ����� ��ȸ�ϰ��������?
-- �̷� �� ����ϴ� OUTER JOIN
-- # OUTER JOIN
-- 1. ���� ������ �������� �ʴ� ��鵵 ��ȸ�� �� ����ϴ� ���α���Դϴ�.
-- 2. OUTER���� ������ ��ȣ�� (+)��ȣ�Դϴ�.
-- 3. INNER������ ���� ������ �������� ������ �ش� ���� ��ȸ���� �ʽ��ϴ�
--   �׷��� OUTER JOIN�� ����(LEFT, RIGHT, FULL)�� �°� ���ǿ� ��Ī���� 
--   �ʴ� ��鵵 ��� NULL�� ó���ؼ� ��ȸ�մϴ�.

-- # LEFT OUTER JOIN
-- ���εǴ� ���� ���̺��� ��� ��ȸ�ϰ�, ������ ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�.

-- ���� ��������� �ϴ� �� ���� ������ Ȥ�� �μ����̺��� �μ��ڵ尡 ��Ī�Ǹ�
-- ���ʽ��� �μ��̸��� ������
-- (�Խñۿ� ����� ��� �ϴ� �Խñ� ��ü ��ȸ���ּ��� - OUTER JOIN)
-- (�Խñۿ� ����� �ִ� �Խñ۸� ��ü ��ȸ ���ּ��� - INNER JOIN)

-- ǥ�� OUTER JOIN
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E
LEFT OUTER JOIN TB_DEPT D -- OUTER JOIN�� ������ �־�� ��.
ON E.DEPT_CD = D.DEPT_CD;
-- LEFT : ����(TB.EMP E)�� �� �����ְ�, �������� ON ���ǿ� ��Ī�ϴ� �͸� ������
-- ��Ī�� ���� �����ְ�, ��Ī �ȵǴ� ��� �����ʹ� NULL�� ������.

SELECT
    *
FROM TB_EMP E
LEFT JOIN TB_DEPT D -- LEFT JOIN �̶�� �ٿ��� �ᵵ ��.
ON E.DEPT_CD = D.DEPT_CD;

SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E, TB_DEPT D
WHERE E.DEPT_CD = D.DEPT_CD;

-- ����Ŭ OUTER ����
-- LEFT : �������ǿ��� �����ʿ� (+) �� ����.
-- RIGHT : ���ʿ� (+) �� ����
-- FULL : �������� ����.
-- (+) �� ������ ǥ�����ο��� ON���� ��ġ�ϴ� ����
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E, TB_DEPT D
WHERE E.DEPT_CD = D.DEPT_CD(+);


-- # RIGHT OUTER JOIN
-- ���εǴ� ������ ���̺��� ��� ��ȸ�ϰ�, ���� ���̺��� ���ǿ� ��Ī�Ȱ͸� ��ȸ

-- ���� ��� �μ������� ��ȸ�ϰ� ������ Ȥ�� �μ��ڵ尡 ��ġ�ϴ� ����� ������ �Բ� ��ȸ����
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E
RIGHT OUTER JOIN TB_DEPT D 
ON E.DEPT_CD = D.DEPT_CD;
-- �������� �� ������ ������ ��Ī�� �͸� ���´�.

SELECT
    *
FROM TB_EMP E
RIGHT OUTER JOIN TB_DEPT D 
ON E.DEPT_CD = D.DEPT_CD;

-- ����Ŭ OUTER ����
SELECT
    E.EMP_NM,
    D.DEPT_NM
FROM TB_EMP E, TB_DEPT D 
WHERE E.DEPT_CD (+) = D.DEPT_CD;


-- #FULL OUTER JOIN
-- - ���� �������̺�, ������ �������̺��� ��� �����ְ� ��Ī�Ǹ� ��Ī�����ͱ��� ���ļ� ������

SELECT 
    A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
FROM tb_emp A
FULL OUTER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
ORDER BY A.emp_no 
;

-- ����� 46��, �μ��� 16�� �� ��
-- �μ��� �Ҽӵ� ����� 41���̰�
-- ����� �����ϴ� �μ��� 14�� �̴�.

-- INNER JOIN �� ��� 41��
-- LEFT JOIN �� ��� 46�� (INNER JOIN 41 + �μ��� ���»�� 5 = 46��)
-- RIGHT JOIN �� ��� (INNER JOIN 41 + ����� ���� �μ� 2 = 43��)
-- FULL JOIN �� ���(INNER JOIN 41 + LEFT ���� 5 + RIGHT ���� 2 = 48��)


-- # SELF JOIN
-- 1. �ϳ��� ���̺��� �ڱ� �ڽ��� ���̺��� �����ϴ� ����Դϴ�.
-- 2. �ڱ� �ڽ� ���̺��� pk�� fk�� ���������մϴ�.

-- �ڱ�� �ڱ��� �������̺��� �����ϴ� ��.
SELECT 
    A.emp_no "�����ȣ",
    A.emp_nm "�����",
    A.addr "����ּ�",
    A.direct_manager_emp_no "���� ��� ���",
    B.emp_nm "����",
    B.addr "����ּ�"
FROM tb_emp A
INNER JOIN tb_emp B
ON a.direct_manager_emp_no = b.emp_no
ORDER BY A.emp_no
;

-- �翷���� ��ġ�� JOIN ���Ʒ��� ��ġ�� ���տ�����



