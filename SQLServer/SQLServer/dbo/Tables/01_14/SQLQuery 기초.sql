Use tempdb
Go

-- Tables ���̺� ����
Create Table Tables
(
	Id		int				Identity(1,1)	Primary Key,
	Note	NVarChar(Max)	Null
)
Go

-- ���̺� �� �߰�
Insert Into Tables (Note) Values ('�ȳ��ϼ���')
Go

-- ���̺� �� ���
Select * From Tables
Go

-- ���̺� �� ����
Update Tables Set Note = '�ݰ����ϴ�.' Where Id = 1
Go

-- ���̺� �� ����
Delete Tables Where Id =1
Go