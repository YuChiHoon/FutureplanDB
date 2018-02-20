-- SQL 구문

-- DDL: 데이터 정의 언어
-- [1] 테이블 생성
Create Table AddressBooks
(
	Id		Int Identity(1,1) Primary Key,
	Name	NVarChar(25) Not Null,
	Phone	NVarChar(15) Null
)
Go

-- [2] 테이블 구조 수정
-- Alter Table AddressBooks ...

-- [3] 테이블 구조 삭제
Drop Table AddressBooks
Go

-- DML: 데이터 조작 언어
-- [1] Insert문: 입력
Insert Into AddressBooks(Name, Phone) Values('홍길동', '114');
Insert Into AddressBooks(Name, Phone) Values('백두산', '119');

-- [2] Select문: 출력/조회
Select * From AddressBooks;
Select * From AddressBooks Where Name = '백두산';

-- [3] Update문: 수정/갱신
Update AddressBooks Set Phone = '120' Where Name = '백두산';

-- [4] Delete문: 삭제
Delete AddressBooks Where Id = 2;