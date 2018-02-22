--[1] ���� ���̺� ����
Create Table dbo.Members
(
	Num		 Int Identity(1,1) Not Null Primary Key,	-- �Ϸù�ȣ
	Name	 NVarChar(25) Not Null,						-- �̸�
	Age		 TinyInt Null,								-- ����
	Address	 NVarChar(100) Null							-- �ּ�
)
Go

--[2] ���� ������ �Է�
Insert Into Members(Name, Age, Address) Values(N'ȫ�浿', 21, N'����')
Go
Insert Members Values(N'��λ�', 100, N'�λ�')
GO
Insert Members Values(N'�Ѷ��', 30, N'�λ�')
Go

--[3] ������ ��ȸ
Select * From Members
Go

--[!] ��������(���� ����)
-- 3���� �������� ���̺��� ū �����͸� ���
Select * From Members 
Where Age > (Select Age From Members Where Num = 3)
Go

-- �ּҰ� '�λ�'�� ����� ���̺��� ũ�ų� ���� ������ ���
Select * From Members 
Where Age >= (Select Age From Members Where Address = N'�λ�')
Go -- ����

-- �� ������ ���� : Or(Any, Some) ����, And(All) ����
Select * From Members 
Where Age >= Any(Select Age From Members Where Address = N'�λ�')
Go -- 30, 100

Select * From Members 
Where Age >= All(Select Age From Members Where Address = N'�λ�')
Go -- 100


-- ���̺� ����
Drop Table dbo.Members
Go

