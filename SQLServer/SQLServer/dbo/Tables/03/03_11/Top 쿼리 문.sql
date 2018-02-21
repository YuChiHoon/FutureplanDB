-- Top ���� : ���� N���� ���ڵ带 ��ȯ

-- ��ü ������ ���
Select [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Order By [s].[Num];

-- Top 3 : ���� 3���� ���ڵ�
Select Top (3)
	   [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Order By [s].[Num];

-- Top �ۼ�Ʈ : ���� 50 �ۼ�Ʈ
Select Top (50) Percent
	   [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Order By [s].[Num];

-- Ties ��� �� : �⺻ ���� 2��
Select Top (2)
	   [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Where [s].[Age] = '10'
Order By [s].[Age];

-- Ties ��� �� : 2+����
Select Top (2) WiTH TIES
	   [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Where [s].[Age] = '10'
Order By [s].[Age];