-- 카테고리 응용 프로그램 설계

--[0] 테이블 설계
Create Table dbo.Categories
(
	CategoryID		Int Identity(1,1) Not Null Primary Key,		-- 카테고리 번호
	CategoryName	NVarChar(50),								-- 카테고리 명
	--
	SuperCategory	Int Null,									-- 부모카테고리번호(확장용)
	Align SmallInt Default(0)									-- 카테고리보여지는순서(확장용)
)
Go

--[1] 입력
Insert Categories Values(N'컴퓨터', Null, 0);
Insert Categories Values(N'노트북', 1, 1);
Insert Categories Values(N'핸드폰', Null, 2);
Insert Categories Values(N'신규', 3, 3);

--[2] 출력
Select CategoryID
From Categories
Order By Align Asc

--[3] 상세
Select * From Categories Where CategoryID = 1

--[4] 수정
Update Categories
Set
	CategoryName = '콤퓨타'
Where CategoryID = 1

--[!] 테이블 삭제
--Drop Table dbo.Categories
--Go

--[0] 뷰(View) 생성 : Select문 전용
--[a] 대분류 데이터를 출력하는 구문을 줄여서 출력
Select CategoryID, CategoryName
From Categories
Where SuperCategory Is Null
-- Order By CategoryName Asc

--[b] 위 구문을 줄여주는 뷰(View) 생성
Create View dbo.GetTopCategory
As
	Select CategoryID, CategoryName
	From Categories
	Where SuperCategory Is Null
	-- Order By CategoryName Asc
Go

--[c] 뷰(가상 테이블) 사용 : 약간 줄어들죠??
Select * From GetTopCategory
Order By CategoryName Asc

--[d] 뷰(가상 테이블) 수정 : 암호화
sp_helptext GetTopCategory -- 뷰 구문 보기

Alter View dbo.GetTopCategory
With Encryption		-- 개체 암호화 옵션
As
	Select CategoryID, CategoryName
	From Categories
	Where SuperCategory Is Null
	-- Order By CategoryName Asc
Go

sp_helptext GetTopCategory -- 안 보임

--[!] 뷰 구문 수정 : 스키마 바인딩 적용
Alter View dbo.GetTopCategory
With SchemaBinding		--Categories 테이블 변경 불가능
As
	Select CategoryID, CategoryName
	From dbo.Categories
	Where SuperCategory Is Null
Go

-- 위 저장 프로시저가 만들어져 있는 상태에서
-- 아래 구문과 같이 테이블의 내용이 변경되면 에러 발생
Alter Table dbo.Categories
Alter Column CategoryName VarChar(100)
Go

--[!] 뷰 구문 수정 : 체크 옵션???
Alter view dbo.GetTopCategory
As
	Select *
	From dbo.Categories
	Where SuperCategory Is Null		-- SuperCategory가 Null일떄만 입력/수정 가능

	With Check Option		-- 조건절에 해당하는 데이터만 입력/수정 가능
Go

Insert GetTopCategory Values(N'가전', Null, 0);		-- 입력 가능
Insert GetTopCategory Values(N'냉장고', 1, 1);		-- 입력 불가

--[e] 뷰 삭제
Drop View dbo.GetTopCategory
Go