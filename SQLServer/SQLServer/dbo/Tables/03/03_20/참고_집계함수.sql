-- ���� �Լ�

-- ���� ���̺�
Create Table dbo.Score
(
	Num Int Identity(1,1) Primary Key,		-- �Ϸù�ȣ
	Kor Int Not Null,						-- ��������
	Eng Int Not Null						-- ��������
)
GO

-- ���� ������ �Է�
Insert Score Values(100, 90);
Insert Score Values(80, 75);
Insert Score Values(85, 90);

-- ��ü ���
Select * From Score
Go

-- �������� ¦�� ������ ����/���/ī��Ʈ
Select Sum(Kor) From Score Where Kor % 2 = 0;		-- Sum() : �հ�
Select Count(Kor) From Score Where Kor % 2 = 0;		-- Count() : �Ǽ�
Select Avg(Kor) From Score Where Kor % 2 = 0;		-- Avg() : ���
Select Max(Kor) From Score Where Kor % 2 = 0;		-- Max() : �ִ�
Select Min(Kor) From Score Where Kor % 2 = 0;		-- Min() : �ּҰ�