-- DotNetSale ���ι� ������Ʈ
-- (http://www.VisulAcademy.com/)

-- Categories ���̺� ����

-- [1] ī�װ�: ��ǰ�з�
Create Table dbo.Categories
(
	CategoryId		Int Identity(1, 1) Not Null Primary Key,			-- ī�װ� ��ȣ
	CategoryName	NVarChar(50),										-- ī�װ���
	--
	SuperCategory	Int Null References Categories(CategoryId),			-- �θ�ī�װ���ȣ(Ȯ���) : ParentId, ParentCategoryId�� �̸� �����ص� ����
	Align			SmallInt Default(0)									-- ī�װ� �������� ����
)
Go

--[!] ���� ������ �Է�
-- �Ʒ� ī�װ��� ǥ���ϰ��� �Ѵٸ�???
-- - å
-- - ����
-- - ��ǻ��
--		-��Ʈ��
--			-�Ｚ
--			-LG
--		-����ũ��

-- ��з��� ����Ѵٸ�... SuperCategory�� Null�̸�, �ֻ��� �з�, �׷��� ������ ���� �з�
-- -- �� �ٸ� ����� SuperCategory�� -1���� �ְ� ����(���α׷� �ۼ��� �ξ� ����)
--Insert Into Categories Values(N'å',Null, 1)
--Go
--Insert Into Categories Values(N'����',Null, 2)
--Go
--Insert Into Categories Values(N'��ǻ��',Null, 3)
--Go

--Select * From Categories
--Go

-- ���߼� �з��� Ȯ���Ѵٸ�...
--Insert Into Categories Values(N'��Ʈ��',3, 1)
--Go
--Insert Into Categories Values(N'����ũ��',3, 2)
--Go
--Insert Into Categories Values(N'�Ｚ',4, 1)
--Go
--Insert Into Categories Values(N'LG',4, 2)
--Go

-- ��ü ��� ����
--Select * From Categories Order By CategoryId Asc
--Go

-- ��з��� ��� ����
--Select CategoryId, CategoryName From Categories Where SuperCategory Is Null
--Order By Align Asc
--Go

-- ���� ī�װ��� ���� ī�װ� ����� ����ϴ� ����
--Declare @SuperCategory Int
--Set @SuperCategory = 3 -- 3�� ī�װ��� �ڽ� ī�װ� ����Ʈ
--Select CategoryId, CategoryName From Categories
--Where SuperCategory = @SuperCategory
--Go