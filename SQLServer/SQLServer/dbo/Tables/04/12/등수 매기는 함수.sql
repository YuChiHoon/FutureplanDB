-- 샘플 테이블
Create Table School
(
	학년 Int,
	반 VarChar(10),
	학생수 Int
)
Go

--샘플 데이터 입력
Insert Into School Values(1, '1반', 40)
Insert Into School Values(1, '2반', 45)
Insert Into School Values(1, '3반', 35)
Insert Into School Values(1, '4반', 30)
Insert Into School Values(2, '1반', 40)
Insert Into School Values(2, '2반', 60)
Insert Into School Values(2, '3반', 50)
Insert Into School Values(2, '4반', 50)
Insert Into School Values(3, '1반', 40)
Insert Into School Values(3, '2반', 70)
Insert Into School Values(3, '3반', 65)
Insert Into School Values(3, '4반', 40)

-- 기본 출력
Select * From School
-- 피봇 출력
Select 학년, [1반], [2반], [3반], [4반]
From School
	Pivot
	(
		Sum(학생수) For 반 In([1반], [2반], [3반], [4반])
	)
	As PVT
Go

-- UnPivot 출력
Select 학년, 반, 학생수
From
(
	Select 학년, [1반], [2반], [3반], [4반]
	From School
		Pivot
		(
			Sum(학생수) For 반 In([1반], [2반], [3반], [4반])
		)
		As PVT
) As PVT2
UnPivot(학생수 For 반 In([1반], [2반], [3반], [4반])) As UnPvt
Go

--[6] 순위 (Rack()) 매기기
Select * From School

Select *, Rank() Over(Order By 학생수 Desc) As  순위 From School					-- 같은 등수로 표기
																					-- 1,2,3,3,5등
Select *, Rank() Over(Partition By 학년 Order By 학생수 Desc) As  순위 From School	-- 학년 별로 등수

Select *, Dense_Rank() Over(Order By 학생수 Desc) As  순위 From School				-- 1,2,3,3,4등

Select *, Row_Number() Over(Order By 학생수 Desc) As  순위 From School				-- 나오는 순서대로 등수

Select *, NTile(5) Over(Order By 학생수 Desc) As  순위 From School					-- 5등까지 비율에 따라서
Go