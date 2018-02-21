-- 테이블 별칭(Table Alias) : 긴 테이블 이름을 줄여서 표현

-- 기본
Select Name From [dbo].[Sample];

-- 테이블에 별칭 사용 전
Select [dbo].[Sample].[Name]
From [dbo].[Sample];

-- 테이블에 별칭 사용 후
Select [dept].[Name]
From [dbo].[Sample] as [dept];

-- 축약형
Select [d].[Name]
From [dbo].[Sample] as [d];