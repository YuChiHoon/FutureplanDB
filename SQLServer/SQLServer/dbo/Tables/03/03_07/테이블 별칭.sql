-- ���̺� ��Ī(Table Alias) : �� ���̺� �̸��� �ٿ��� ǥ��

-- �⺻
Select Name From [dbo].[Sample];

-- ���̺� ��Ī ��� ��
Select [dbo].[Sample].[Name]
From [dbo].[Sample];

-- ���̺� ��Ī ��� ��
Select [dept].[Name]
From [dbo].[Sample] as [dept];

-- �����
Select [d].[Name]
From [dbo].[Sample] as [d];