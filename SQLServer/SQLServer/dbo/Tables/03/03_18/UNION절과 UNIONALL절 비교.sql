-- SQL Server UNION vs. UNION ALL절 비교
-- UNION 중복 처리
-- UNION ALL 중복 처리 X

-- 하나 이상의 테이블을 묶어서 마치 하나의 테이블인것처럼 모와서 출력

-- 2개 이상의 테이블로 이루어진 게시판에서 데이터를 읽어와서
-- 하나의 리스트로 보여주고자할 때 주로 사용

-- 임시 테이블 생성 및 데이터 입력
Declare @Table1 Table(Num Int);
	Insert into @Table1 Values(1);
	Insert into @Table1 Values(2);
	Insert into @Table1 Values(3);
	Insert into @Table1 Values(4);
	Insert into @Table1 Values(5);
Declare @Table2 Table(Num Int);
	Insert into @Table2 Values(3);
	Insert into @Table2 Values(4);
	Insert into @Table2 Values(5);
	Insert into @Table2 Values(6);
	Insert into @Table2 Values(7);

-- UNION절 실행 : Distinct Sort 진행
Select Num From @Table1
UNION
Select Num From @Table2;

-- UNION ALL절 실행
Select Num From @Table1
UNION ALL
Select Num From @Table2;