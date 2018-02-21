-- Create/Alter/Drop/Insert/Select/Update/Delete문 연습

--[1] 테이블 생성
Create Table dbo.Sample
(
	Num Int Identity(1,1) Primary Key,
	Name NVarChar(25),
	Age Int Default 21
)
Go

--[2] 테이블 구조 수정  --개체 탐색기로 하는게 더 편함
--Alter Table dbo.Sample
--(
--
--)
--Go

--[3] 테이블 구조 삭제
--Drop Table dbo.Sample
--Go

--[4] 데이터 입력
Insert Into Sample(Name, Age) Values(N'홍길동', 21)
Insert Into Sample(Name, Age) Values(N'홍길동', Default)
Insert Sample(Name, Age) Values(N'홍길동', 21)
Insert Sample Select Top 3 Name, Age From Sample		-- 상위 3개 복사해서 추가
Select * Into NewSample From Sample						-- Sample테이블을 NewSample 테이블 생성 후 내용 복사
Select * From NewSample
insert Sample Output Inserted.* Values(N'홍길동',21)	-- 추가 동시에 결과창에 출력
Go

--[5] 데이터 출력
Select * From Sample
Select Num, Name, Age From Sample
Select * From Sample Where Num > 10
Select * From Sample Where Name Like N'%홍%'
Select * From Sample Where Num In (2,4,6)
Select * From Sample Where (Num % 2 = 0)
Select Avg(Age) From Sample
Go

--[6] 데이터 수정
Begin Tran								-- 백업
	Update Sample
	Set Name = N'백두산', Age = 100
	Where Num = 1
--RollBack Tran							-- 되될리기
Commit Tran								-- 백업 제거
Go

--[7] 데이터 삭제
Delete Sample
Where Name Like N'%두%'
Go