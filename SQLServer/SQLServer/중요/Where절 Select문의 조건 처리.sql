--Where �� : Select���� ���� ó�� (And, Or, Not)

-- ��ü ���
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]

-- ���� ����
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where [s].[Num] = '1';

-- AND ���� : �� �� ���� ������ ��
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where [s].[Num] = '1' And [s].[Age] = '10';

-- OR ���� : �� �߿� �ϳ��� ���� ��
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where [s].[Num] = '1' Or [s].[Age] = '10';

-- And�� Or�� �̷���� ����
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where [s].[Num] = '1' Or ([s].[Age] = '10' And [s].[Name] = N'ȫ�浿');

-- Not ���� ~�� �ƴ�
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where Not [s].[Num] = '1';