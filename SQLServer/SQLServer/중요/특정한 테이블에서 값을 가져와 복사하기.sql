-- Insert Into Select
-- : Ư�� ���̺��� ���� �о ���̺� �����ϱ�

Select * From [dbo].[Sample];

-- ���̺� ����

Create Table IIS
(
	Name NVarChar(100),
	Age Int
)
Go

-- [dbo].[Sample]�� �����͸� ��������
Insert Into IIS(Name, Age)
Select [Name], [Age]
From [dbo].[Sample]
Where Num BetWeen 1 and 5

Select * From IIs;

-- ���̺� ����
Drop Table IIS;