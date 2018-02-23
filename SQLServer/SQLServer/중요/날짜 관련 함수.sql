-- 날짜 관련 함수

-- 전체 시간
Select GetDate()

-- 년도
Select Year(GetDate())

-- 월
Select Month(GetDate())

-- 일
Select Day(GetDate())

-- 2018년 크리스마스 며칠 남았는지?
Select DateDiff(dd, GetDate(), '2018-12-25')

-- 본인이 지금짜기 며칠 살아왔는지?
Select DateDiff(dd, '1991-10-15', GetDate())