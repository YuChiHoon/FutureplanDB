--[1] Demains ���̺� : ȸ��/�׷� �ʼ� ����
Create Table dbo.Domains
(
	UID				Int Identity(1,1) Not Null Primary Key,		-- �Ϸù�ȣ(Id)
	DomainID		NVarChar(30) Not Null,							-- ���̵�/�׷���̵�(UserId)
	Name			NVarChar(50) Not Null,							-- �̸�/�׷��/�г���(�ѱ� 7��, ���� 14�ڷ� ����)
	[Type]			NVarChar(10) Not Null,							-- User/Group, ���߿� Type�� DomainType���� �ٲܰ�.
	[Description]	NVarChar(255) Null,							-- ����(�Ұ�)
	-- Added
	CreatedDate		DateTime Default(GetDate())					-- ������(���� �����)
)
Go

--[2] ��Ʈ��(BuiltIn) ������ ����� �Է� : Adminsitrator, Guest, Anonymous
Insert Domains (DomainID, Name, Type, Description)
Values('Administrator', '������', 'User', '���� ���α׷��� �� �����ϴ� ����� ����')
Go

Insert Domains (DomainID, Name, Type, Description)
Values('Guest', '�Խ�Ʈ �����', 'User', '�Խ�Ʈ ����� ����')
Go

Insert Domains (DomainID, Name, Type, Description)
Values('Anonymous', '�͸� �����', 'User', '�͸� ����� ����')
Go

Select * From Domains;

--[3] ��Ƽ �� Insert ����
Insert Domains (DomainID, Name, Type, Description) Values
	('Administrator', '������', 'User', '���� ���α׷��� �� �����ϴ� ����� ����'),
	('Guest', '�Խ�Ʈ �����', 'User', '�Խ�Ʈ ����� ����'),
	('Anonymous', '�͸� �����', 'User', '�͸� ����� ����')
Go