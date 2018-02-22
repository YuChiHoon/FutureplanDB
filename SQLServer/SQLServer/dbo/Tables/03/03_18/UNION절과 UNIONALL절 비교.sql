-- SQL Server UNION vs. UNION ALL�� ��
-- UNION �ߺ� ó��
-- UNION ALL �ߺ� ó�� X

-- �ϳ� �̻��� ���̺��� ��� ��ġ �ϳ��� ���̺��ΰ�ó�� ��ͼ� ���

-- 2�� �̻��� ���̺�� �̷���� �Խ��ǿ��� �����͸� �о�ͼ�
-- �ϳ��� ����Ʈ�� �����ְ����� �� �ַ� ���

-- �ӽ� ���̺� ���� �� ������ �Է�
Declare @Table1 Table(Num Int);
	Insert into @Table1 Values(1);
	Insert into @Table1 Values(2);
	Insert into @Table1 Values(3);
	Insert into @Table1 Values(4);
	Insert into @Table1 Values(5);
Declare @Table2 Table(Num Int);
	Insert into @Table2 Values(3);
	Insert into @Table2 Values(4);
	Insert into @Table2 Values(5);
	Insert into @Table2 Values(6);
	Insert into @Table2 Values(7);

-- UNION�� ���� : Distinct Sort ����
Select Num From @Table1
UNION
Select Num From @Table2;

-- UNION ALL�� ����
Select Num From @Table1
UNION ALL
Select Num From @Table2;