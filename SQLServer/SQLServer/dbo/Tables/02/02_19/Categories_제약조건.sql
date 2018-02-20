Create Table Categories
(
	CategoryID			--[!] 카테고리 일련번호
		int				--[0] 데이터 형식
		Identity(1,1)	--[1] 자동증가값: 1부터 1씩 증가
		Primary Key,	--[2] 기본키(고유한 식별자(Identifier)): 레코드 구분하는 유일한 값
						--    기본키는 Not Null포함, Unique도 포함
	CategoryName		--[!] 카테고리 이름
		NVarChar(25)	
		Not Null		--[3] 널값제약 : Not Null : 반드시 값 입력, Null(널 허용)
)
Go

Create Table dbo.FrontBoards
(
	ItemID									-- [!] 일련번호
		Int Identity(1,1) Primary Key,
	Title
		NVarChar(150) Not Null
		Unique,								-- [4] 유일키제약 :  테이블에서 유일한 값(중복불가)
	Url
		NVarChar(255)
		Null,								-- [5] 널 제약 : NULL :  값을 입력하지 않아도 무관
	[Target] 
		NVarChar(10) 
		Null 
		Check								-- [6] 체크제약 : 주어진 데이터만 입력 허용
		(Target In('_top','_blank','_parent','_self')),
	CreatedDate
		DateTime
		Default(GetDate()),					-- [7] 기본값 제약 : 레코드 생성시 기본값 부여
	CategoryID
		Int
		References Categories(CategoryID)	--[8] 외래키 : 다른 테이블의 기본키와 동일한 값
)
Go


--[2] 에시 데이터 입력 : 자동증가값 체크
Insert Into Categories Values('공지');
Insert Categories Values('뉴스');

Select * From Categories order By CategoryID Asc

Insert Into FrontBoards
Values('닷넷코리아', 'http://www.dotnetkorea.com', '_blank', Default, 1);
Insert Into FrontBoards(Title, Url, Target, CategoryID)
Values('비주얼아카데미', 'http://www.VisualAcademy.com', '_self', 2);

Select * From FrontBoards

--[3] 널값 체크
Insert Into FrontBoards(Url) Values('http://'); -- 에러 Not Null은 비울 수 없음

--[4] 유일키 제약조건 확인
Insert Into FrontBoards
Values('닷넷코리아', 'http://www.dotnetkorea.com', '_blank', Default, 1); -- 에러 닷넷코리아 중복

--[5] 체크제약조건
Insert Into FrontBoards
Values('자바캠퍼스', 'http://', '_main', Default, 1); -- 에러 체크에 _main없음

--[6] 외래키(Foreign Key)
Insert Into FrontBoards
Values('자바캠퍼스', 'http://', '_blank', Default, 3); -- 에러 외래키 1,2만 있음