-- 테이블 변수(Table Variable)

-- 테이블 변수 선언
-- 배치 시작
Declare @Members Table
(
	MemberID	Int Primary Key Not Null,
	MemberName	VarChar(25) Not Null
);

insert @Members Values(1, '홍길동');
insert @Members Values(2, '백두산');
insert @Members Values(3, '한라산');

Select MemberID, MemberName From @Members;
-- 배치 끝

-- 테이블 변수 선언
-- 배치 시작
Declare @Members2 Table
(
	MemberID	Int Primary Key Not Null,
	MemberName	VarChar(25) Not Null
);

insert @Members2 Values(1, '홍길동');
insert @Members2 Values(2, '백두산');
insert @Members2 Values(3, '한라산');
Go	-- 배치의 끝 역활

Select MemberID, MemberName From @Members2;
-- 배치 끝