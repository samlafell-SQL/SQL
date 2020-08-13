-- Logical Models

/*

Refine the conceptual model to come up with an abstract data model

More detail than conceptual

Less detail than physical

*/



/*
1. Specify the type of each attribute (string, date, int, float)
2. Specify Relationships
	-- One to One
    -- One to Many
    -- Many to Many

So, heads up in this example.
We have STUDENT & COURSE
And with student we have dateRegistered.
	-- but it doesn't makes sense under STUDENT since students can be in many courses
    -- and it doesn't make sense in COURSES since courses will have many enrollment dates

So, that makes "Enrollment" an attribute of the relationship between the two tables.
Enrollment needs to be its own entity.

Now we have 3 entities...
STUDENT: firstName, lastName, email, dateRegistered
ENROLLMENT: date, price
COURSE: title, price, instructor, tags

Onto Physical model
*/