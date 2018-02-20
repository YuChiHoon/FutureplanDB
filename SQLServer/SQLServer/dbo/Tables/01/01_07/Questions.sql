 -- Questions 테이블 생성
Create Table Questions (
	Id int Identity(1,1) Not Null Primary Key, -- 일련번호
	Title NVarChar(Max) Not Null                -- 문제 제목(내용)
);

  -- Questions 테이블 삭제
--Drop Table Questions;