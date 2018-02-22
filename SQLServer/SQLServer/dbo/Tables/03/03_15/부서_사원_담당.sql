-- 부서별 사원별 담당 업무

--[1] 부서 테이블
Create Table 부서
(
	[부서번호]	 Int Identity(1,1) Primary Key Not Null,
	[부서명]	 NVarChar(50) Not Null,
)
Go

--[2] 사원 테이블
Create Table 사원
(
	[사원번호]	 Int Identity(1,1) Primary Key Not Null,
	[사명명]	 NVarChar(50) Not Null,
	[부서번호]	 Int -- 부서.부서번호
)
Go

-- [3] 담당 업무
Create Table 담당
(
	[담당번호]	 Int Identity(1,1) Primary Key Not Null,
	[담당명]	 NVarChar(50) Not Null,
	[사원번호]	 Int -- 사원.사원번호
)
Go

-- 예시 데이터 입력
Insert Into 부서 Values(N'부서1');
Insert Into 부서 Values(N'부서2');
Insert Into 부서 Values(N'부서3');
Select * From 부서;

Insert Into 사원 Values(N'홍길동', 1);
Insert Into 사원 Values(N'백두산', 2);
Insert Into 사원 Values(N'임꺽정', 3);
Select * From 사원;

Select d.부서번호, d.부서명, e.사원번호, e.사명명 
From 부서 d Inner Join 사원 e 
On d.부서번호 = e.부서번호;

-- 홍길동은 (컴퓨터, 가전) 담당
Insert Into 담당 Values(N'컴퓨터', 1);
Insert Into 담당 Values(N'가전', 1);

-- 백두산은 (의류) 담당
Insert Into 담당 Values(N'의류', 2);

-- 임꺽정은 (책) 담당
Insert Into 담당 Values(N'책', 3);

-- 부서별 사원별 담당
-- 1단계
Select * From 부서;
-- 2단계
Select * From 사원 Where 부서번호 = 1;
-- 3단게
Select * From 담당 Where 사원번호 = 1;
