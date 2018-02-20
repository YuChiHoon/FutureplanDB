-- SQL ���� 7����

-- [1] ���� �޸��� ���̺� ���� : Memos
Create table dbo.Memos
(
	Num			Int Identity(1,1) Primary Key Not Null, -- ��ȣ
	Name		NVarChar(25) Not Null,					-- �̸�
	Email		NVarChar(50) Null,					-- �̸���
	Title		NVarChar(150) Not Null,				-- �޸�(����)
	PostDate	DateTime Default(GetDate()),		-- �ۼ���
	PostIP		NVarChar(15) Null,					-- IP�ּ�
)
Go

-- [2] ���̺� ���� ����
-- Alter��
-- PostIp �÷� ����
Alter Table dbo.Memos Drop Column PostIP
Go
-- PostIp �÷� �߰�
Alter Table dbo.Memos Add PostIP NVarChar(15) Null
Go

-- SQL ���������� �ϴ°� �� ����.

-- [3] ���̺� ���� ����
-- Drop��
Drop Table dbo.Memos
Go