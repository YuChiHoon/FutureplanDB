-- 데이터베이스 선택
Use tempdb
Go

-- 테이블 만들기

-- 로그(Log) 관리

-- 로그(Logs) 테이블 생성
Create Table Logs
(
	[Id] Int Identity(1, 1) Primary Key Not Null,
	[Message] NVarChar(Max) Null						-- 로그 메시지
)
Go

-- 테이블 구문 수정
Alter Table Logs Add Level NVarChar(128);

-- SQL - Insert문
Insert Into Logs ([Message]) Values ('로그인했습니다.');

Insert Into Logs ([Message]) Values (N'로그인했습니다.'); -- 유니코드 처리

-- SQL - Select문
Select * From Logs;

-- SQL - Update문
Update Logs Set Message = N'로그인했습니다' Where Id = 1;

-- SQL - Delete문
Delete Logs Where Id = 1;

--테이블 삭제
Drop Table Logs
Go