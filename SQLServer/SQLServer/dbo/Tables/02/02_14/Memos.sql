-- SQL 구문 7가지

-- [1] 한줄 메모장 테이블 생성 : Memos
Create table dbo.Memos
(
	Num			Int Identity(1,1) Primary Key Not Null, -- 번호
	Name		NVarChar(25) Not Null,					-- 이름
	Email		NVarChar(50) Null,					-- 이메일
	Title		NVarChar(150) Not Null,				-- 메모(제목)
	PostDate	DateTime Default(GetDate()),		-- 작성일
	PostIP		NVarChar(15) Null,					-- IP주소
)
Go

-- [2] 테이블 구조 변경
-- Alter문
-- PostIp 컬럼 삭제
Alter Table dbo.Memos Drop Column PostIP
Go
-- PostIp 컬럼 추가
Alter Table dbo.Memos Add PostIP NVarChar(15) Null
Go

-- SQL 디자인으로 하는게 더 편함.

-- [3] 테이블 구조 삭제
-- Drop문
Drop Table dbo.Memos
Go