-- 문자 메시지 전송 기록
Create table [dbo].[Smss]
(
	[Id]			Int Identity(1,1) Not Null Primary Key,
	SenderId		Int Null,									-- 전송자 Id
	SenderName		NVarChar(50) Null,							-- 전송자 이름
	RecipientId		int Null,									-- 수신자 Id
	RecipientName	NVarChar(50) Null,							-- 수신자 이름
	RecipientPhone	NVarChar(20) Null,							-- 수신자 전화번호
	Content			NVarChar(Max) Null,							-- 메시지 내용
	PostDate		DateTimeOffset(7) Default(GetDate())		-- 전송 일시
)
Go