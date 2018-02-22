-- 카테고리 테이블 설계
Create Table dbo.Categories
(
	CategoryID		Int Identity(1,1) Not Null Primary Key,		-- 카테고리 번호
	CategoryName	NVarChar(25) Not Null						-- 카테고리 명
)
Go

Insert Categories Values(N'가전');
Insert Categories Values(N'컴퓨터');
Insert Categories Values(N'서적');

-- 상품 테이블 설계
Create Table dbo.Products
(
	ProductID	Int Identity(1,1) Not Null Primary Key,		-- 상품 고유번호
	ModelName	NVarChar(25) Not Null,						-- 상품명
	SellPrice	Int Null,									-- 가격
	CategoryID	Int Null									-- 카테고리(1,2,3)
)
Go

-- 가전, 냉장고, 100
Insert Products Values(N'냉장고', 100, 1);
-- 컴퓨터, 노트북, 200
Insert Products Values(N'노트북', 200, 2);
Insert Products Values(N'데스크톱', 150, 2);

Select * From Categories;
Select * From Products;

Select ModelName, Sellprice
From Products;

-- SQL Server 조인 구문
Select ModelName, SellPrice, CategoryName
From Products, Categories
Where Products.CategoryID = Categories.CategoryID
Go

-- SQL 조인 구문
Select ModelName, SellPrice, CategoryName
From Products Join Categories 
On Products.CategoryID = Categories.CategoryID

-- [데모] 뷰 생성 마법사 사용
SELECT  dbo.Categories.CategoryName, dbo.Products.SellPrice, dbo.Products.ModelName
FROM     dbo.Categories INNER JOIN
               dbo.Products ON dbo.Categories.CategoryID = dbo.Products.CategoryID

-- 조인 구문 상세
Select 
	Products.ModelName, 
	Products.SellPrice, 
	Categories.CategoryName,
	Categories.CategoryID As [카테고리번호]
From Products Inner Join Categories
On Products.CategoryID = Categories.CategoryID
Go

-- 조인 구문 축약 표현
Select p.ModelName, p.SellPrice, c.CategoryName
From Products p Join Categories c 
On p.CategoryID = c.CategoryID

-- 서브 쿼리를 사용한 조인
Select ModelName, SellPrice, CategoryID
From Products
Where CategoryID In (Select CategoryID From Categories)
Go