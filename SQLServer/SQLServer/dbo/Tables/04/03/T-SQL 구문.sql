-- 첨부 파일 관리자
Create Table dbo.AttachFiles
(
	Id			Int Not Null Primary key Identity(1,1),			-- 일련번호
	UserId		Int Null,										-- 사용자 Id
	BoardId		Int Not Null,									-- 게시판 테이블 일련번호
	ArticleId	Int Not Null,									-- 게시글 Id(Num)
	FileName	NVarChar(255) Null,								-- 파일명
	FileSize	Int Null,										-- 파일크기
	DownCount	Int Default 0,									-- 다운수
	TimeStamp	DateTimeOffset(7) Default(GetDate()) Null		-- 업로드 시간
)
Go

-- 예시문
-- 입력
Insert Into AttachFiles
	(UserId, BoardId, ArticleId, FileName, FileSize)
Values
	(6, 4, 1, N'Photo.png',1234)
Go

-- 출력
Select * From AttachFiles
Go

-- T-SQL 구문을 사용하여 200건의 샘플 데이터 저장하기
-- Declare		: 변수 선언
-- Set			: 변수에 값을 항당
-- Begin, End	: 하나의 실행문의 시작과 종료 구분 {}

Declare @i Int																		-- 변수 선언
Set @i = 1																			-- 초기식
While @i <= 200																		-- 조건식
	Begin																			-- {
		Insert Into AttachFiles	(UserId, BoardId, ArticleId, FileName, FileSize)	-- 실행문
		Values	(@i, @i, @i, N'Photo.png',1234)
		Set @i = @i + 1																-- 증감식
	End																				-- }
Go