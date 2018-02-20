-- [0] tempdb 사용
Use tempdb
Go

-- [1] 실습용 테이블 생성 : 간단 공지사항(뉴스) 게시판
-- 글번호, 제목, 링크, 타겟, 작성일
Create Table dbo.FrontBoard
(
	ItemID int 
		Identity(1,1)					-- [1] 자동증가 : 1부터 1씩증가
		Primary Key						-- [2] 널값제약 : Not Null(반드시 입력)
		Not Null,						-- [3] 기본키(단일) : 레코드 구분 필드
	Title NVarChar(150)
		Not Null
		Unique,							-- [4] 유일키 : 테이블에서 유일한 값
	Url NVarChar(255) 
		Null,
	Target NVarChar(10) 
		Null 
		Check							-- [5] 체크제약 : 주어진 데이터만 입력 허용
		(Target In('_top','_blank','_parent','_self')),
	CreatedDate Datetime 
		Default(GetDate())				-- [6] 기본값 : 레코드 생성시 기본값 부여
)
Go

-- [2] 자동증가 테스트
Insert FrontBoard Values('제목1', 'http://www.hawaso.com/', '_blank', GetDate())
Go
Insert FrontBoard Values('제목2', 'http://www.dotnetkorea.com/', '_blank', GetDate())
Go

Select * From FrontBoard
Go

-- [3] 널값 체크
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('제목3', 'http://www.live.com/', '_blank', GetDate())
Go
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('http://www.live.com/','_blank',GetDate())
Go -- 에러 발생

-- [4] 유일키 제약 조건
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('제목1', 'http://www.microsoft.com/', '_blank', GetDate())
Go --에러 발생


-- [5] 체크 제약 조건
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('제목4', Null, Null, GetDate())
Go -- 정상
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('제목5', Null, 'test', GetDate())
Go -- 에러 발생

-- [1] Taget 필드에 위에서 지정한 값 외의 값을 입력해본다.
Insert FrontBoard Values('test','test','test',GETDATE())	 -- 에러남.
-- [2] Taget 필드에 Check 제약조건에서 지정한 값을 입력한다.
Insert FrontBoard Values('test','test','_blank',GETDATE())	 -- 입력됨.


-- [6] 기본 제약 조건
Insert FrontBoard(Title)
Values('제목5')
Go

Select * From FrontBoard
Go

-- 다 기본값인 경우
Create Table DefaultTest(PostDate DateTime Default(GetDate()))
Go
Insert DefaultTest Default Values
Go