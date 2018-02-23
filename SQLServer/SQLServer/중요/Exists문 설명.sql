-- ������ ���̺� ����
Create Table dbo.Domains
(
	Id		Int Primary Key Identity(1,1) Not Null,
	Name	NVarChar(25) Not Null
)
Go

-- ��ü ������ ��ȸ
Select * From Domains;

-- 1�� ���ڵ� �Է� �õ�
Insert Domains (Name) Select 'Administrators';

-- Not Exists�� ���� ������ ������� ���� ����
-- 1�� ���ڵ� �Է� �õ�
Insert Domains (Name) Select 'Administrators' 
Where Not Exists (Select * From Domains Where Id = 1)

-- 2�� ���ڵ� �Է� �õ�
Insert Domains (Name) Select 'Everyone' 
Where Not Exists (Select * From Domains Where Id = 2); -- ������ �����ض�

-- 3�� ���ڵ� �Է� �õ�
Insert Domains (Name) Select 'Users' 
Where Not Exists (Select * From Domains Where Id = 3 Or Name = 'Users'); -- 3���ڵ�� Users�� ������

-- Exists�� Where ���̸� �����ض�.
Select * From Domains Where Exists (Select * From Domains Where Name = 'Users');
Select * From Domains Where Not Exists (Select * From Domains Where Name = 'Users');

-- ���� ��õ�ϴ� ���� ���� :
-- Insert ~ Select ~ Where Not Exists(Select ...);