-- 연습용 테이블 생성
Create Table dbo.Domains
(
	Id		Int Primary Key Identity(1,1) Not Null,
	Name	NVarChar(25) Not Null
)
Go

-- 전체 데이터 조회
Select * From Domains;

-- 1번 레코드 입력 시도
Insert Domains (Name) Select 'Administrators';

-- Not Exists는 하위 쿼리의 결과값에 따라서 실행
-- 1번 레코드 입력 시도
Insert Domains (Name) Select 'Administrators' 
Where Not Exists (Select * From Domains Where Id = 1)

-- 2번 레코드 입력 시도
Insert Domains (Name) Select 'Everyone' 
Where Not Exists (Select * From Domains Where Id = 2); -- 없으면 실행해라

-- 3번 레코드 입력 시도
Insert Domains (Name) Select 'Users' 
Where Not Exists (Select * From Domains Where Id = 3 Or Name = 'Users'); -- 3레코드랑 Users가 없으면

-- Exists는 Where 참이면 실행해라.
Select * From Domains Where Exists (Select * From Domains Where Name = 'Users');
Select * From Domains Where Not Exists (Select * From Domains Where Name = 'Users');

-- 가장 추천하는 쿼리 구문 :
-- Insert ~ Select ~ Where Not Exists(Select ...);