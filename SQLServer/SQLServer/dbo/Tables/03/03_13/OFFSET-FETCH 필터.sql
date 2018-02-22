-- OFFSET-FETCH 필터

--[0] 연습용 테이블 생성
Create Table dbo.Memos
(
	Num			 Int Identity(1,1) Not Null Primary Key,	-- 번호
	[Name]		 NVarChar(25) Not Null,						-- 이름
	Email		 NVarChar(50) Null,							-- 이메일
	Title		 NVarChar(150) Null,						-- 한줄메모(제목)
	PostDate	 DateTime Null Default(GetDate())			-- 작성일
)
Go

--[0] Memos테이블에 1000건의 레코드 기록
Declare @i Int
Set @i = 1
While @i <= 200
Begin
	Insert Memos(Name, Email, Title) Values(N'백두산', 'hong@hong.com', N'백록담')
	Insert Memos(Name, Email, Title) Values(N'한라산', 'hong@hong.com', N'제주도')
	Insert Memos(Name, Email, Title) Values(N'지리산', 'hong@hong.com', N'지루함')
	Insert Memos(Name, Email, Title) Values(N'계룡산', 'hong@hong.com', N'계룡대')
	Insert Memos(Name, Email, Title) Values(N'홍길동', 'hong@hong.com', N'홍길순')
	Set @i = @i + 1
End
Go

--[1] 전체 레코드 조회
Select Count(*) From Memos;
Select * From Memos Order By Num Desc;

--[2] OFFSET-FETCH 필터를 사용한 페이징 처리: SQL 2012부터 지원
Select *
From Memos
Order By Num Desc
OffSet 5 Rows Fetch Next 3 Rows Only; -- 5개 행 Skip 후 3개 행 Take

Select *
From Memos
Order By Num Desc
OffSet 10 Rows Fetch Next 10 Rows Only; -- 10개 행 Skip 후 10개 행 Take


-- 단수형 일때에는 Rows 대신에 Row 사용해도 됨
Select *
From Memos
Order By Num Desc
--OffSet 1 Rows Fetch Next 1 Rows Only; -- 1개 행 Skip 후 1개 행 Take
OffSet 1 Row Fetch Next 1 Row Only; -- 1개 행 Skip 후 1개 행 Take

-- 페이징 처리 [저장 프로시저] 또는 [함수]로 확장해서 사용
Select *
From Memos
Order By Num Desc
OffSet (2 -1) * 10 Rows Fetch Next 10 Rows Only;