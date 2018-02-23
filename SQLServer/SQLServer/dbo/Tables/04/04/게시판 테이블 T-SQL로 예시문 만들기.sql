-- [!] 게시판 테이블 설계 : Articles, Notes, Memos, (Basic+Upload+Reply)
--Drop Table [Articles]

Create Table [dbo].[Articles]
(
	[Id]			Int Not Null Primary Key Identity(1,1),		-- 일련번호

	Name			NVarChar(25) Not Null,						-- 이름
	PostDate		DateTime Default GetDate() Not Null,		-- 작성일
	PostIp			NVarChar(15) Null,							-- 작성 IP
	Title			NVarChar(150) Not Null,						-- 제목
	Content			NText Not Null,								-- 내용
	Category		NVarChar(20) Default('Free') Null,			-- 카테고리(확장...) => '공지', '자유', '자료;, '사진'...

	Email			NVarChar(100) Null,							-- 이메일
	Password		NVarChar(255) Null,							-- 비밀번호
	ReadCount		Int Default 0,								-- 조회수
	Encoding		NVarChar(10) Not Null,						-- 인코딩(HTML/Text/Mixed)
	Homepage		NVarChar(100) Null,							-- 홈페이지
	ModifyDate		DateTime Null,								-- 수정일
	ModifyIp		NVarChar(15) Null,							-- 수정 IP
	FileName		NVarChar(255) Null,							-- 파일명
	FileSize		Int Default	0,								-- 파일크기
	DownCount		Int Default 0,								-- 다운수
	CommentCount	Int Default 0,								-- 댓글수

	Ref				Int Not Null,								-- 참조(부모글)
	Step			Int Default 0,								-- 답변깊이(레벨)
	RefOrder		Int Default 0,								-- 답변순서
	AnswerNum		Int Default 0,								-- 답변수
	ParentNum		Int Default 0,								-- 부모글번호

	Num				Int Null,									-- 번호(확장,,,)
	UserId			Int Null,									-- (확장...) 사용자 테이블 ID
	CategoryId		Int Null Default 0,							-- (확장...) 카테고리 테이블 ID
	BoardId			Int Null Default 0,							-- (확장...) 게시판(Boards) 테이블 ID
	AplicationId	Int Null Default 0							-- (확장...) 응용 프로그램 ID
)
Go

--[!] 예시문

--[1] 입력
--Insert Into Articles (Name,	PostDate, PostIp, Title, Content, Category, Encoding, Ref) 
--Values (N'홍길동', GetDate(), '127.0.0.1', N'게시판 테이블 만들기', N'내용 들어오는 곳...', N'공지', N'Plain-Text', 1)
--Go

Declare @BoardId Int
Set @BoardId = 1

-- Ref 값 가져오기: 처음이면 1로 초기화
Declare @MaxRef Int
Select @MaxRef = Max(IsNull(Ref,0))				-- 경고: 집계 또는 다른 Set 작업에 의해 Null값이 제거되었습니다. => IsNull() 함수 사용
From Articles
Where BoardId = @BoardId

If @MaxRef Is Null
	Begin
		Set @MaxRef = 1		-- 테이블 생성 후 처음만 비교
	End
Else
	Begin
		Set @MaxRef = @MaxRef + 1
	End

-- Num 값 가져오기: 처음이면 1로 초기화
Declare @MaxNum Int
Select @MaxNum = Max(IsNull(Num,0)) 
From Articles
Where BoardId = @BoardId

If @MaxNum Is Null
	Begin
		Set @MaxNum = 1		-- 테이블 생성 후 처음만 비교
	End
Else
	Begin
		Set @MaxNum = @MaxNum + 1
	End

Insert Into Articles 
(
	Name,	PostDate, PostIp, Title, Content, Category, Encoding, Ref,Num, BoardId,
	UserId, Email, Password, Homepage, FileName, FileSize
) 
Values 
(
	N'홍길동', GetDate(), N'127.0.0.1', N'게시판 테이블 만들기', N'내용 들어오는 곳...', N'공지', N'Plain-Text', @MaxRef, @MaxNum, @BoardId,
	0, N'Red@red.net', N'1234', N'http://www.devlec.com', N'Photo.jpg', N'1234'
)
Go

Select * From Articles Order By Ref Desc
Go