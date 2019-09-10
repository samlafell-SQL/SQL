libname orion "Z:/Desktop/MSA/SQL/SAS_Data";
run;

proc sql;
	select e.Employee_ID, e.Gender, ea.Employee_Name
	from orion.employees as e, orion.employee_addresses as ea
	where e.Employee_ID=ea.Employee_ID;
quit;

/* Using SAS, produce a report containing Employee_Name and calculated years of
service (YOS) as of September 1st, 2018. Limit the report to employees where
YOS > 30. Order the output alphabetically by Employee_Name. */
proc sql;
	SELECT ea.Employee_Name, int((' 1SEP2018'd - ep.Employee_Hire_Date)/365.25) as YOS
	FROM orion.employee_addresses as ea, orion.employee_payroll as ep
	WHERE ea.Employee_ID=ep.Employee_ID;
quit;


/* Creating a Summary Report for Two Tables */
/*The head of the Sales Department wants to know how many of each product was
sold since the beginning of 2010 (determined by Order_Date). The report should
include the product ID, the product name, and the total sold for that product
(determined by the sum of Quantity). Order the report by descending Total Sold,
and ascending Product_Name*/
proc sql;
	select of.Product_ID, pd.Product_Name, sum(of.Quantity) as Total_Sold
	from orion.product_dim as pd, orion.order_fact as of
	where of.Product_ID=pd.Product_ID and year(of.Order_Date) ge 2010
	group by of.Product_ID
	order by Total_Sold desc, pd.Product_Name asc;
quit;