-- ESTO ES UN COMENTARIO

-- Ejercicio Básico: Empleados y Contactos 
--Objetivo: Crear una consulta SQL que liste 
--los nombres, apellidos, títulos de trabajo y 
--direcciones de correo electrónico de los empleados 
--cuyos apellidos comiencen con la letra 'A'. Los resultados 
--deben ordenarse por apellido.

--mi solucion.... NO SIRVE PORQUE TENGO QUE AGARRAR LOS DATOS DE CADA TABLA ESPECIFICA
--SELECT LN.EmailAddress, LN.FirstName, LN.LastName, LN.JobTitle
--FROM HumanResources.vEmployee AS LN
--WHERE LastName LIKE	'A%'
--order by ln.LastName


select 
	p.FirstName, 
	p.LastName,
	e.JobTitle,
	ea.EmailAddress
from Person.Person as p
join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
join Person.EmailAddress as ea
	on p.BusinessEntityID = ea.BusinessEntityID
where p.LastName like 'A%'
order by p.LastName