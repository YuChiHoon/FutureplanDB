-- [!] 게시판 테이블 설계 : Articles, Notes, Memos, (Basic+Upload+Reply)
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
	CategoryId		Int Null,									-- (확장...) 카테고리 테이블 ID
	UserId			Int Null									-- (확장...) 사용자 테이블 ID
)
Go