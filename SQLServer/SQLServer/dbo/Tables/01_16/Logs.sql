-- �����ͺ��̽� ����
Use tempdb
Go

-- ���̺� �����

-- �α�(Log) ����

-- �α�(Logs) ���̺� ����
Create Table Logs
(
	[Id] Int Identity(1, 1) Primary Key Not Null,
	[Message] NVarChar(Max) Null						-- �α� �޽���
)
Go

-- ���̺� ���� ����
Alter Table Logs Add Level NVarChar(128);

-- SQL - Insert��
Insert Into Logs ([Message]) Values ('�α����߽��ϴ�.');

Insert Into Logs ([Message]) Values (N'�α����߽��ϴ�.'); -- �����ڵ� ó��

-- SQL - Select��
Select * From Logs;

-- SQL - Update��
Update Logs Set Message = N'�α����߽��ϴ�' Where Id = 1;

-- SQL - Delete��
Delete Logs Where Id = 1;

--���̺� ����
Drop Table Logs
Go