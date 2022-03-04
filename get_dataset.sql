
SELECT EPH.BusinessEntityID
	, EDH.DepartmentID
	, EPH.RateChangeDate
	, EPH.Rate
	, EPH.PayFrequency
	, E.LoginID
	, E.OrganizationLevel
	, E.JobTitle
	, E.BirthDate
	, E.MaritalStatus
	, E.Gender
	, E.HireDate
	, E.SalariedFlag
	, E.VacationHours
	, E.SickLeaveHours
	, E.CurrentFlag
	, EDH.ShiftID
	, EDH.StartDate
	, EDH.EndDate
	, EDH.ModifiedDate
	, D.Name [DepartmentName]
	, D.GroupName [Sub-Department]
  FROM [AdventureWorks2019].[HumanResources].[EmployeePayHistory] EPH
  FULL OUTER JOIN [AdventureWorks2019].[HumanResources].[Employee] E ON E.BusinessEntityID = EPH.BusinessEntityID
  JOIN [AdventureWorks2019].[HumanResources].[EmployeeDepartmentHistory] EDH ON EDH.BusinessEntityID = EPH.BusinessEntityID AND EDH.StartDate >= EPH.RateChangeDate
  JOIN [AdventureWorks2019].[HumanResources].[Department] D ON D.DepartmentID = EDH.DepartmentID
;