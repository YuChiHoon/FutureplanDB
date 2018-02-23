-- ī�װ� ���� ���α׷� ����

--[0] ���̺� ����
Create Table dbo.Categories
(
	CategoryID		Int Identity(1,1) Not Null Primary Key,		-- ī�װ� ��ȣ
	CategoryName	NVarChar(50),								-- ī�װ� ��
	--
	SuperCategory	Int Null,									-- �θ�ī�װ���ȣ(Ȯ���)
	Align SmallInt Default(0)									-- ī�װ��������¼���(Ȯ���)
)
Go

--[1] �Է�
Insert Categories Values(N'��ǻ��', Null, 0);
Insert Categories Values(N'��Ʈ��', 1, 1);
Insert Categories Values(N'�ڵ���', Null, 2);
Insert Categories Values(N'�ű�', 3, 3);

--[2] ���
Select CategoryID
From Categories
Order By Align Asc

--[3] ��
Select * From Categories Where CategoryID = 1

--[4] ����
Update Categories
Set
	CategoryName = '��ǻŸ'
Where CategoryID = 1

--[!] ���̺� ����
--Drop Table dbo.Categories
--Go

--[0] ��(View) ���� : Select�� ����
--[a] ��з� �����͸� ����ϴ� ������ �ٿ��� ���
Select CategoryID, CategoryName
From Categories
Where SuperCategory Is Null
-- Order By CategoryName Asc

--[b] �� ������ �ٿ��ִ� ��(View) ����
Create View dbo.GetTopCategory
As
	Select CategoryID, CategoryName
	From Categories
	Where SuperCategory Is Null
	-- Order By CategoryName Asc
Go

--[c] ��(���� ���̺�) ��� : �ణ �پ����??
Select * From GetTopCategory
Order By CategoryName Asc

--[d] ��(���� ���̺�) ���� : ��ȣȭ
sp_helptext GetTopCategory -- �� ���� ����

Alter View dbo.GetTopCategory
With Encryption		-- ��ü ��ȣȭ �ɼ�
As
	Select CategoryID, CategoryName
	From Categories
	Where SuperCategory Is Null
	-- Order By CategoryName Asc
Go

sp_helptext GetTopCategory -- �� ����

--[!] �� ���� ���� : ��Ű�� ���ε� ����
Alter View dbo.GetTopCategory
With SchemaBinding		--Categories ���̺� ���� �Ұ���
As
	Select CategoryID, CategoryName
	From dbo.Categories
	Where SuperCategory Is Null
Go

-- �� ���� ���ν����� ������� �ִ� ���¿���
-- �Ʒ� ������ ���� ���̺��� ������ ����Ǹ� ���� �߻�
Alter Table dbo.Categories
Alter Column CategoryName VarChar(100)
Go

--[!] �� ���� ���� : üũ �ɼ�???
Alter view dbo.GetTopCategory
As
	Select *
	From dbo.Categories
	Where SuperCategory Is Null		-- SuperCategory�� Null�ϋ��� �Է�/���� ����

	With Check Option		-- �������� �ش��ϴ� �����͸� �Է�/���� ����
Go

Insert GetTopCategory Values(N'����', Null, 0);		-- �Է� ����
Insert GetTopCategory Values(N'�����', 1, 1);		-- �Է� �Ұ�

--[e] �� ����
Drop View dbo.GetTopCategory
Go