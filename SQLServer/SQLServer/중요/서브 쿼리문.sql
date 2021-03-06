--[1] 샘플 테이블 생성
Create Table dbo.Members
(
	Num		 Int Identity(1,1) Not Null Primary Key,	-- 일련번호
	Name	 NVarChar(25) Not Null,						-- 이름
	Age		 TinyInt Null,								-- 나이
	Address	 NVarChar(100) Null							-- 주소
)
Go

--[2] 예시 데이터 입력
Insert Into Members(Name, Age, Address) Values(N'홍길동', 21, N'서울')
Go
Insert Members Values(N'백두산', 100, N'부산')
GO
Insert Members Values(N'한라산', 30, N'부산')
Go

--[3] 테이터 조회
Select * From Members
Go

--[!] 하위쿼리(서브 쿼리)
-- 3번인 데이터의 나이보다 큰 데이터만 출력
Select * From Members 
Where Age > (Select Age From Members Where Num = 3)
Go

-- 주소가 '부산'인 사람의 나이보다 크거나 같은 데이터 출력
Select * From Members 
Where Age >= (Select Age From Members Where Address = N'부산')
Go -- 에러

-- 위 구문을 개선 : Or(Any, Some) 연산, And(All) 연산
Select * From Members 
Where Age >= Any(Select Age From Members Where Address = N'부산')
Go -- 30, 100

Select * From Members 
Where Age >= All(Select Age From Members Where Address = N'부산')
Go -- 100


-- 테이블 삭제
Drop Table dbo.Members
Go

