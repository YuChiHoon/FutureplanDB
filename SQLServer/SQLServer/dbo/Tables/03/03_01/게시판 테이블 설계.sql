-- [!] �Խ��� ���̺� ���� : Articles, Notes, Memos, (Basic+Upload+Reply)
Create Table [dbo].[Articles]
(
	[Id]			Int Not Null Primary Key Identity(1,1),		-- �Ϸù�ȣ

	Name			NVarChar(25) Not Null,						-- �̸�
	PostDate		DateTime Default GetDate() Not Null,		-- �ۼ���
	PostIp			NVarChar(15) Null,							-- �ۼ� IP
	Title			NVarChar(150) Not Null,						-- ����
	Content			NText Not Null,								-- ����
	Category		NVarChar(20) Default('Free') Null,			-- ī�װ�(Ȯ��...) => '����', '����', '�ڷ�;, '����'...

	Email			NVarChar(100) Null,							-- �̸���
	Password		NVarChar(255) Null,							-- ��й�ȣ
	ReadCount		Int Default 0,								-- ��ȸ��
	Encoding		NVarChar(10) Not Null,						-- ���ڵ�(HTML/Text/Mixed)
	Homepage		NVarChar(100) Null,							-- Ȩ������
	ModifyDate		DateTime Null,								-- ������
	ModifyIp		NVarChar(15) Null,							-- ���� IP
	FileName		NVarChar(255) Null,							-- ���ϸ�
	FileSize		Int Default	0,								-- ����ũ��
	DownCount		Int Default 0,								-- �ٿ��
	CommentCount	Int Default 0,								-- ��ۼ�

	Ref				Int Not Null,								-- ����(�θ��)
	Step			Int Default 0,								-- �亯����(����)
	RefOrder		Int Default 0,								-- �亯����
	AnswerNum		Int Default 0,								-- �亯��
	ParentNum		Int Default 0,								-- �θ�۹�ȣ

	Num				Int Null,									-- ��ȣ(Ȯ��,,,)
	CategoryId		Int Null,									-- (Ȯ��...) ī�װ� ���̺� ID
	UserId			Int Null									-- (Ȯ��...) ����� ���̺� ID
)
Go