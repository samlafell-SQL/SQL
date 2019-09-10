/* Day 2 -- Displaying Query Results */

libname orion "Z:/Desktop/MSA/SQL/SAS_Data";
run;

proc sql;
	create table temp as
	select name, age+10 as new_age label='New Age'
	from sashelp.class;
quit;

proc print data=temp label;
run;


/* Rows 17-27 are the same operation shown two different ways */
proc sql;
	select employee_id, salary*0.10 as bonus
	from orion.employee_information
	where calculated bonus > 3000;
quit;

proc sql;
	select employee_id, salary*0.10 as bonus
	from orion.employee_information
	having bonus > 3000;
quit;


proc sql;
	select Department, count(*) as Count
	from orion.employee_information
	group by Department
	having Count ge 25
	order by Count desc;
quit;



/* Lab 1 */

proc sql;
	select distinct City
	from orion.employee_addresses
	group by City
	order by City desc;
quit;


proc sql;
	select Employee_ID, Recipients, Qtr1
	from orion.employee_donations
	having Qtr1 ge 20.00
	order by Qtr1 desc;
quit;


