-- 테이블 생성
Create Table dbo.Customers
(
	Num			 Int Identity(1,1) Primary Key,		-- 일련 번호
	Name		NVarChar(25) Not Null,				-- 이름
	Age			TinyInt Null,						-- 나이
	Address		NVarChar(100)						-- 주소
)
Go

-- 샘플 데이터 입력
Insert Customers Values(N'홍길동', 21, N'서울')
Insert Customers Values(N'백두산', 31, N'서울')
Insert Customers Values(N'한라산', 41, N'부산')
Insert Customers Values(N'지리산', 21, N'부산')
Insert Customers Values(N'설악산', 31, N'대전')

-- Select문 주요 기능 확인
-- 전체 고객 리스트
Select * From Customers

--[1] 중복제거(Distinct) : 고객들이 사는 지역을 중복없이 출력하시오.
Select Distinct Address From Customers

--[2] Group By : 집계함수 그룹화 : 같은 지역 고객의 나이의 평균
Select Address, Avg(Age) From Customers
Group By Address -- 그룹화

--[3] 조건이 있는 집계함수 그룹화 : 같은 지역 고객중 나이가 40이상인 고객의 나이의 평균
Select Address, Avg(Age) From Customers
Where Age >= 40
Group By Address

-- Group By All : 위 쿼리문 중 조건에 맞지 않아도 지역 리스트
Select Address, Avg(Age) From Customers
Where Age >= 40
Group By All Address

--[4] Having : 집계함수에 대한 조건 처리
-- 같은 지역 고객의 나이의 평균이 30 이상인 데이터만 출력
Select Address, Avg(Age) As 나이평균 From Customers
Group By Address
Having Avg(Age) >= 30

--[5] RollUp : 소계 : 지역별 나이를 출력 후 나의 소계(중간합계)
Select Address, Sum(Age) As 나이합 From Customers
Group By Address With RollUp

--[6] Cube : 소계 : 지역별 나이를 출력 후 나의 소계(중간합계)
Select Address, Sum(Age) As 나이합 From Customers
Group By Address With Cube

--[7] Grouping() 함수 : RollUp/Cube 사용시 그룹화 된 항목인지 표시(예:1,아니요:0)
Select Address, Sum(Age) As 나이합, GROUPING(Address) As 그룹화여부
From Customers
Group By Address With Cube

--[8] Compute : 출력 결과에 대한 집계
Select Address, Age
From Customers
Compute Sum(Age),Avg(Age) -- 삭제 예정 코드 대신 RollUp 사용하시오.

--[9] Compute : 출력 결과에 대한 집계에 대한 정렬
Select Address, Age
From Customers
Order By Address
Compute Sum(Age),Avg(Age) by Address -- 삭제 예정 코드 대신 RollUp 사용하시오.

--[10] Case : 문장 대체
Select Name, Age, 
	Address = Case Address When N'서울' Then N'Seoul'
						   When N'부산' Then N'Busan'
						   Else N'다른지역'
						   End
From Customers