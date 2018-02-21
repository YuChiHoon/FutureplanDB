-- Group By 절과 Having 절
-- Group By : 특정 컬럼(필드)를 그룹화(묶음)
-- Having : Group By로 묶인 항목에 대한 조건 처리

-- 테이블 생성 및 데이터 입력
Create Table dbo.Orders
(
	[상품명]	NVarChar(10),
	[판매개수]	Int
)
Go

-- 샘플 데이터 입력
Insert Orders Values(N'RADIO',5)
Insert Orders Values(N'TV',3)
Insert Orders Values(N'AUDIO',1)
Insert Orders Values(N'DVD',7)
Insert Orders Values(N'RADIO',3)
Insert Orders Values(N'DVD',8)
Insert Orders Values(N'TV',10)

--[1] 집계함수 사용 검색
Select * From Orders;

Select Count([판매개수]) As [총판매횟수] From Orders;
Select Sum([판매개수]) As [총판매개수] From Orders;
Select Avg([판매개수]) As [총판매평균] From Orders;
Select Max([판매개수]) As [최대판매개수] From Orders;
Select Min([판매개수]) As [최소판매개수] From Orders;

--[2] 아래 구문을 실행시켜보면 다음과 같은 에러가 나타난다.
--Orders.상품명 열이 집계 함수에 없고 Grouo By 절이 없으므로 Select 목록에서 사용 할 수 없다.
Select [상품명], Avg([판매개수]) As [총판매평균] From Orders;

--[3] 위와 같이 집계함수로 계산되어지지 않고 그룹화 되어 출력시킬 필드는 반드시 Group By절에 기록해야한다.
Select [상품명], Avg([판매개수]) As [총판매평균]
From Orders
Group By [상품명]; -- 묶는 조건 : 상품명, 집계함수 : 총판매평균

--[4] 만약 그룹별 총 판매평균이 5이상인것만 출력하고자 할 때에는 Having절에 조건을 추가해야한다.
Select [상품명], Sum([판매개수]) As [총판매합계], Avg([판매개수]) As [총판매평균]
From Orders
Group By [상품명]
Having Avg([판매개수]) >= 5 -- 판매개수의 평균이 5이상인것만 검색
Order By [상품명] Asc;

--[5] 퀴즈 : 주문별 상품 판매량이 5이상이고,
--그룹별 총 판매 평균이 7이상인것만 [상품명]으로 오름차순 정렬하시오.
Select [상품명], Sum([판매개수]) As [판매합계]
From Orders
Where [판매개수] >=5			-- 기존 필드에 대한 조건 먼저 처리
Group By [상품명]				-- 묶는 조건
Having Sum([판매개수]) >= 7		-- 집계함수에 대한 조건 처리
Order By [상품명] Asc;