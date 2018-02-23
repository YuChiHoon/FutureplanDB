-- 주석 : 한줄/두줄 연산자
--[1] 한줄 주석
--(더블 하이픈) 뒤로 나오는 모든 문자열은 주석(설명문)으로 처리된다.
--[2] 여러줄 주석
/*
슬래시별표와 별표슬래시 사이에 있는 모든 SQL문은
주석(설명문)으로 처리된다.
*/

Create Table Memos
(
	Num Int Identity(1,1) Primary Key Not Null,
	Name VarChar(10),
	Email VarChar(50),
	Title VarChar(200)
)
Go

-- 변수 선언
--[1] 변수 선언
Declare @i Int
--[2] 변수 초기화
Set @i = 10
--[3] 변수 참조(사용)
Select @i
Go
--Print @i
--Go

--[4] 여러개의 변수 선언
Declare
	@Name VarChar(10),
	@Email VarChar(50),
	@Title VarChar(200)
--[5] 변수 초기화
Set @Name = ''
Set @Email = ''
Set @Title = ''
--[6] Memos 테이블 필드값을 변수에 저장
Select
	@Name = Name,
	@Email = Email,
	@Title = Title
From Memos
Where Num = 1
--[7] 변수 값 출력
Select @Name, @Email, @Title
Go

--[0] 산술 연산자
Select 3+4
Select 3-4

--[1] % 연산자 : 나머지 연산자라고도 함
Select 3 % 4					-- 3 나누기 4를 했을 경우. 몫 : 0, 나머지 : 3, 이 때 나머지값

--[2] 문자열 연결 연산 : '+' 연산자 사용
Select '안녕' + '하세요'		-- 안녕하세요

--[3]비교
-- >, >=, <, <=
Select * From Memos Where 3 > 4		-- 조건이 거짓
Go
Select * From Memos Where 3 = 4		-- 조건이 거짓
Go
Select * From Memos Where 3 <> 4	-- 둘이 다르면
Go

-- 기교성 코드(?) : 무조건 실행 : SQL 인젝션(해킹)
Select * From Memos Where 1 = 1
Go

--[0] 논리
-- Or(||) : 하나라도 참이면, 참
Select * From Memos Where (3 = 4) Or (3 <> 4)
Go
-- And(&&) : 둘다 참일때에만, 참
Select * From Memos Where (3 = 4) And (3 <> 4)
Go

-- 조건문
--[1] 변수 선언
Declare @testNum Int
--[2] 변수 초기화
Set @testNum = 3
--[3] 조건 출력
If(@testNum % 2) = 0		-- 모든수를 2로 나누었을 때 나머지가 0이면 짝수
	Select '짝수입니다.'
Else
	Select '홀수입니다.'
Go

-- 단문이 아니라 복문일 경우는 Begin~End 구문을 사용한다.
Declare @Num Int
Set @Num = 10

If(@Num % 2) = 0		-- 모든수를 2로 나누었을 때 나머지가 0이면 짝수
	Begin
		Select '짝수입니다.'
		Select '짝수입니다.'
	End
Else
	Begin
		Select '홀수입니다.'
		Select '홀수입니다.'
	End
Go

-- 반복문
--[1] 아래 구문을 100번 샐행(F5)
Insert Memos Values('홍길동', 'h@h.com', '홍길동입니다.')
Go
--[2] 아래 Insert문을 100번 샐행 : While문
Declare @i Int
Set @i = 1					--[a] 초기식
While @i < 100				--[b] 조건식
	Begin
		Insert Memos
		Values('홍길동', 'h@h.com', '홍길동입니다.')
		Set @i = @i + 1		--[c] 증감식
	End
Go

-- 1부터 100까지의 합
Declare @testNum int , @testSum int
Set @testNum = 0
Set @testSum = 0

--Select @testNum, @testSum
While 1 = 1 -- 참일 동안
	Begin
		Set @testSum = @testSum + @testNum		-- 1~100 까지의 수 누적
		Set @testNum = @testNum + 1				-- @Num는 1씩 증가
		If @testNum > 100						-- 100보다 크면 While문 종료
			Break								-- 100까지만 계산
		Else									-- 100보다 크지 ㅏㄶ으면 계속 실행
			Continue
	End
Print '1부터 100까지의 합'
Print @testSum
Go

--[퀴즈] 1부터 100까지의 합 : 2550
Declare @testNum int , @testSum int
Set @testNum = 0
Set @testSum = 0

--Select @testNum, @testSum
While 1 = 1 -- 참일 동안
	Begin
		If @testNum % 2 = 0
			Set @testSum = @testSum + @testNum
			
		Set @testNum = @testNum + 1	
		If @testNum > 100
			Break
		Else
			Continue
	End
Print '1부터 100까지의 짝수의 합'
Print @testSum
Go