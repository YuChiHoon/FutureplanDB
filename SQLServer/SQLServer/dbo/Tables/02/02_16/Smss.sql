-- ���� �޽��� ���� ���
Create table [dbo].[Smss]
(
	[Id]			Int Identity(1,1) Not Null Primary Key,
	SenderId		Int Null,									-- ������ Id
	SenderName		NVarChar(50) Null,							-- ������ �̸�
	RecipientId		int Null,									-- ������ Id
	RecipientName	NVarChar(50) Null,							-- ������ �̸�
	RecipientPhone	NVarChar(20) Null,							-- ������ ��ȭ��ȣ
	Content			NVarChar(Max) Null,							-- �޽��� ����
	PostDate		DateTimeOffset(7) Default(GetDate())		-- ���� �Ͻ�
)
Go