libname orion 'Z:/Desktop/MSA/SQL/SAS_Data';
run;

proc sql;
	SELECT a.Name
	FROM orion.train_a AS a
	INTERSECT
	SELECT b.Name
	FROM orion.train_b AS b
	WHERE Edate is not missing;
quit;


/* List the employees who have 
completed training A but not training B.*/
proc sql;
	SELECT a.Name
	FROM orion.train_a AS a
	EXCEPT
	SELECT b.Name
	FROM orion.train_b AS b
	WHERE Edate is not missing;
quit;



	