-- Course.SQL
-- ���� ���̺�
Create Table dbo.Courses
(
	CourseId Int Identity(1, 1) Not Null Primary Key,		-- �Ϸù�ȣ
	CourseName NVarChar(25) Not Null,						-- �����̸�
)
Go

-- �Է�
Insert Into Courses	(CourseName) Values (N'C#')
Go

-- ���
Select * From Courses Order By CourseId Asc
Go