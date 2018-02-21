-- Top 쿼리 : 상위 N개의 레코드를 반환

-- 전체 데이터 출력
Select [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Order By [s].[Num];

-- Top 3 : 상위 3개의 레코드
Select Top (3)
	   [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Order By [s].[Num];

-- Top 퍼센트 : 상위 50 퍼센트
Select Top (50) Percent
	   [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Order By [s].[Num];

-- Ties 사용 전 : 기본 상위 2개
Select Top (2)
	   [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Where [s].[Age] = '10'
Order By [s].[Age];

-- Ties 사용 후 : 2+알파
Select Top (2) WiTH TIES
	   [Num],
	   [Name],
	   [Age]
From [dbo].[Sample] As [s]
Where [s].[Age] = '10'
Order By [s].[Age];