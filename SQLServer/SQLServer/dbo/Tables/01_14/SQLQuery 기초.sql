Use tempdb
Go

-- Tables 테이블 생성
Create Table Tables
(
	Id		int				Identity(1,1)	Primary Key,
	Note	NVarChar(Max)	Null
)
Go

-- 테이블 값 추가
Insert Into Tables (Note) Values ('안녕하세요')
Go

-- 테이블 값 출력
Select * From Tables
Go

-- 테이블 값 변경
Update Tables Set Note = '반갑습니다.' Where Id = 1
Go

-- 테이블 값 삭제
Delete Tables Where Id =1
Go