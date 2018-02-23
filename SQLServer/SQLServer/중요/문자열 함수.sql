-- 문자열 관련 함수

Declare @s NVarChar(20)
Set @s = N' Abc Def Fed Cba '

-- 전체 출력
Select @s

-- 문자열의 길이
Select Len(@s)		-- 뒤에 오는 공백 제외

-- 공백 제거
Select LTrim(@s)	-- 선행 고백 제거
Select RTrim(@s)	-- 후행(오른쪽 공백 제거)

-- 모두 대문자로 표시
Select Upper(@s)

-- 모두 소문자로 표시
Select Lower(@s)

-- 왼쪽에서 6자 출력
Select Left(@s,6)

-- 오른쪽에서 6자 출력
Select Right(@s,6)

-- 거꾸로 출력
Select Reverse(@s)

-- 특정 문자열을 찾아서 있으면 변환(치환)
Select Replace(@s, N'Abc', N'초콜릿')

-- 특정 문자열 반복
Select Replicate(N'안녕', 10)

-- 공백(Space)을 여러개 출력
Select'[' + Space(10) + ']'

-- 정수형을 문자열로 변환
Select Str(12345) + '6789'

-- 문자열 검색 : 어디부터 몇자 검색
Select SubString(@s,6,3)

-- 특정 문자열의 위치값 검색
Select CharIndex(N'Def',@s)		--6번째 위치에 존재한다.