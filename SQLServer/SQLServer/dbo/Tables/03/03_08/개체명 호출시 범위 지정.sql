-- 개체명 호출시 [] 대괄호를 사용하여 범위를 설정할 수 있음

Select * From [dbo].[Sample];

Select Name, [Name] From [dbo].[Sample];

Create Table #Department
(
	DepartmentId Int Not Null
);

Select DepartmentId From #Department;

Create Table #Department2
(
	[Department Id] Int Not Null
);

Select [Department Id] From #Department2;