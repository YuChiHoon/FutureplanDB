-- ī�װ� ���̺� ����
Create Table dbo.Categories
(
	CategoryID		Int Identity(1,1) Not Null Primary Key,		-- ī�װ� ��ȣ
	CategoryName	NVarChar(25) Not Null						-- ī�װ� ��
)
Go

Insert Categories Values(N'����');
Insert Categories Values(N'��ǻ��');
Insert Categories Values(N'����');

-- ��ǰ ���̺� ����
Create Table dbo.Products
(
	ProductID	Int Identity(1,1) Not Null Primary Key,		-- ��ǰ ������ȣ
	ModelName	NVarChar(25) Not Null,						-- ��ǰ��
	SellPrice	Int Null,									-- ����
	CategoryID	Int Null									-- ī�װ�(1,2,3)
)
Go

-- ����, �����, 100
Insert Products Values(N'�����', 100, 1);
-- ��ǻ��, ��Ʈ��, 200
Insert Products Values(N'��Ʈ��', 200, 2);
Insert Products Values(N'����ũ��', 150, 2);

Select * From Categories;
Select * From Products;

Select ModelName, Sellprice
From Products;

-- SQL Server ���� ����
Select ModelName, SellPrice, CategoryName
From Products, Categories
Where Products.CategoryID = Categories.CategoryID
Go

-- SQL ���� ����
Select ModelName, SellPrice, CategoryName
From Products Join Categories 
On Products.CategoryID = Categories.CategoryID

-- [����] �� ���� ������ ���
SELECT  dbo.Categories.CategoryName, dbo.Products.SellPrice, dbo.Products.ModelName
FROM     dbo.Categories INNER JOIN
               dbo.Products ON dbo.Categories.CategoryID = dbo.Products.CategoryID

-- ���� ���� ��
Select 
	Products.ModelName, 
	Products.SellPrice, 
	Categories.CategoryName,
	Categories.CategoryID As [ī�װ���ȣ]
From Products Inner Join Categories
On Products.CategoryID = Categories.CategoryID
Go

-- ���� ���� ��� ǥ��
Select p.ModelName, p.SellPrice, c.CategoryName
From Products p Join Categories c 
On p.CategoryID = c.CategoryID

-- ���� ������ ����� ����
Select ModelName, SellPrice, CategoryID
From Products
Where CategoryID In (Select CategoryID From Categories)
Go