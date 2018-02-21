-- Insert Into Select
-- : 특정 테이블의 값을 읽어서 테이블에 저장하기

Select * From [dbo].[Sample];

-- 테이블 설계

Create Table IIS
(
	Name NVarChar(100),
	Age Int
)
Go

-- [dbo].[Sample]의 데이터를 가져오기
Insert Into IIS(Name, Age)
Select [Name], [Age]
From [dbo].[Sample]
Where Num BetWeen 1 and 5

Select * From IIs;

-- 테이블 삭제
Drop Table IIS;