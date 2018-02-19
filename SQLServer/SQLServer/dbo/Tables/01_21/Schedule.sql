-- 일정관리 테이블 생성: 커뮤니티(Communities 테이블)에 따른 일정관리
Create Table dbo.Schedules
(
	[Num]			 int identity(1, 1) Primary Key Not Null,		-- 일련 번호
	[Community]		 NVarChar(25) Null,								-- 커뮤니티(그룹) 이름 => CommunityId
	[SYear]			 SmallInt Not Null,								-- 년
	[SMonth]		 SmallInt Not Null,								-- 월
	[SDay]			 SmallInt Not Null,								-- 일
	[SHour]			 SmallInt Null,									-- 시
	[SMinute]		 SmallInt Null,									-- 분

	[Title]			 NVarChar(150) Not Null,						-- 일정 제목
	[Content]		 NVarChar(Max) Null,							-- 일정 내용
	[Created]		 DateTimeOffset(7) Default(GetDate()),			-- 일정 등록일
	[Icon]			 NVarChar(20) Null,								-- 아이콘
	[Ref]			 Int Null,										-- 외부 일정 참조용
)
Go

-- [!] 예시문
-- 일정 입력
Insert Into Schedules (Community, SYear, SMonth, SDay, SHour, SMinute, Title, Content, Created, Icon, Ref)
Values (N'SQL', 2018, 1, 20, 12, 30, N'SQL문 연습', N'Insert, Select, Update, Delete 연습', Default, '', NULL)

-- 일정 출력
Select * From Schedules;

Select * From Schedules Where Community = N'SQL' And SYear = 2018 And SMonth = 1 And SDay = 20;

-- 일정 상세
Select * From Schedules Where Num = 1 And Community = N'SQL';

-- 일정 수정
Update Schedules
Set
	Community = N'C#', 
	SYear = 2019, 
	SMonth = 1, 
	SDay = 25, 
	SHour = 10, 
	SMinute = 30, 
	Title = N'C# 공부', 
	Content = N'Visual Studio를 사용한 C# 개발'
Where Num = 1;

-- 일정 삭제
Delete Schedules Where Num = 1;