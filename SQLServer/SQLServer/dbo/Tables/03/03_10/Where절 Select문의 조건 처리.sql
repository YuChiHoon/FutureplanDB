--Where 절 : Select문의 조건 처리 (And, Or, Not)

-- 전체 출력
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]

-- 단일 구문
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where [s].[Num] = '1';

-- AND 연산 : 둘 다 참일 때에만 참
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where [s].[Num] = '1' And [s].[Age] = '10';

-- OR 연산 : 둘 중에 하나가 참일 때
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where [s].[Num] = '1' Or [s].[Age] = '10';

-- And와 Or로 이루어진 구문
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where [s].[Num] = '1' Or ([s].[Age] = '10' And [s].[Name] = N'홍길동');

-- Not 연산 ~가 아닌
Select [s].[Num],
	   [s].[Name],
	   [s].[Age]
From [dbo].[Sample] AS [s]
Where Not [s].[Num] = '1';