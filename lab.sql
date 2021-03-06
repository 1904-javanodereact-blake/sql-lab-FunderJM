-- cSQL Lab
-- 1.0
-- Setting up Oracle Chinook
-- In this section you will begin the process of working with the Oracle Chinook 
-- database
-- Task – Open the Chinook_Oracle.sql file and execute the scripts within.
-- 2.0 SQL Queries
-- In this section you will be performing various queries against the Oracle Chinook 
-- database.
-- 2.1 SELECT
-- Task – Select all records from the Employee table.
    SELECT * FROM employee;
-- Task – Select all records from the Employee table where last name is King.
    SELECT * FROM employee
	WHERE lastname = 'King';
-- Task – Select all records from the Employee table where first name is Andrew and 
-- REPORTSTO is NULL.
    SELECT * FROM employee
	WHERE firstname = 'Andrew' AND reportsto ISNULL;
-- 2.2 ORDER BY
-- Task – Select all albums in Album table and sort result set in descending order by 
-- title.
    SELECT * FROM album
	ORDER BY title DESC;
-- Task – Select first name from Customer and sort result set in ascending order by city
    SELECT firstname FROM customer
	ORDER BY city ASC;
-- 2.3 INSERT INTO
-- Task – Insert two new records into Genre table
    INSERT INTO genre (genreid,name)
	VALUES( 26,'New Retro Wave'),
			(27,'Uneasy listening');
-- Task – Insert two new records into Employee table
    INSERT INTO employee (employeeid, lastname, firstname, title, reportsto, birthdate, hiredate, address, city, state, country, postalcode, phone, fax, email)
	VALUES ( 9,'Wayne', 'Bruce', 'IT Staff', 1, '1939-05-30', '2019-04-10', '1007 Mountain Drive', 'Gotham', 'NY', 'United States', '53540', '+1(212)555-6342', '+1(212)555-6390', 'bruce@chinookcorp.com' ),
			(10, 'Clark', 'Kent', 'Sales Support Agent', 2, '1938-04-18', '2019-04-10', '1938 Sullivan Lane', 'Metropolis', 'NY', 'United States', '62960', '+1(412)555-1938', '+1(412)555-1993', 'clark@chinookcorp.com');
-- Task – Insert two new records into Customer table
    INSERT INTO customer (customerid, firstname, lastname, address, city, country, postalcode, phone, email)
	VALUES ( 60,'Alexander', 'Delarge', '655321 Cellblock Road', 'London', 'United Kingdom', 'N1 5LH', '+44 020 8231 0707', 'orange@gmail.com' ),
			( 61, 'John', 'Savage', '1932 World Drive', 'Metropolis', 'United States', '62960', '+1(412)555-4242', 'savagenew@hotmail.com');
-- 2.4 UPDATE
-- Task – Update Aaron Mitchell in Customer table to Robert Walter
    UPDATE customer
	SET firstname = 'Robert', lastname = 'Walter'
	Where firstname = 'Aaron' AND lastname = 'Mitchell';
-- Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to 
-- “CCR”
    UPDATE artist
	SET name = 'ccr'
	WHERE name = 'Creedence Clearwater Revival';
-- 2.5 LIKE
-- Task – Select all invoices with a billing address like “T%”
    SELECT * FROM invoice
	WHERE billingaddress LIKE 'T%';
-- 2.6 BETWEEN
-- Task – Select all invoices that have a total between 15 and 50
    SELECT * FROM invoice
	WHERE total BETWEEN 15 AND 50;
-- Task – Select all employees hired between 1
-- st
--  of June 2003 and 1
-- st
--  of March 2004
-- 1
    SELECT * FROM employee
	WHERE hiredate BETWEEN '2003-06-01' AND '2004-03-01';
-- 2.7 DELETE
-- Task – Delete a record in Customer table where the name is Robert Walter (There 
-- may be constraints that rely on this, find out how to resolve them).
    DELETE FROM invoiceline
	WHERE invoiceid = 50, 61, 116,245, 268, 342;
	--performed separately fo each number in the list.
	
DELETE FROM invoice
	WHERE customerid = 32;

DELETE FROM customer
	WHERE firstname = 'Robert' AND lastname = 'Walter';
-- 3.0
-- SQL Functions
-- In this section you will be using the Oracle system functions, as well as your own 
-- functions, to perform various actions against the database
-- 3.1 System Defined Functions
-- Task – Use a function that returns the current time.
    SELECT CURRENT_TIMESTAMP;
-- Task – Use a function that returns the length of a mediatype from the mediatype 
-- table
	SELECT LENGTH(name) FROM mediatype
	WHERE mediatypeid = 4;
-- 3.2 System Defined Aggregate Functions
-- Task – Use a function that returns the average total of all invoices
	SELECT CAST (AVG(total) AS DECIMAL(10,2)) from invoice;
-- Task – Use a function that returns the most expensive track
	SELECT MAX(unitprice) FROM track;
-- 7.0 JOINS
-- In this section you will be working with combing various tables through the use of 
-- joins. You will work with outer, inner, right, left, cross, and self joins.
-- 7.1 INNER
-- Task – Create an inner join that joins customers and orders and specifies the name 
-- of the customer and the invoiceId.
	SELECT customer.firstname, customer.lastname, invoice.invoiceid FROM customer
INNER JOIN
invoice ON customer.customerid = invoice.customerid;
-- 7.2 OUTER
-- Task – Create an outer join that joins the customer and invoice table, specifying the 
-- CustomerId, firstname, lastname, invoiceId, and total.
	SELECT customer.customerid, customer.firstname, customer.lastname, invoice.invoiceid, invoice.total FROM customer
FULL OUTER JOIN
invoice ON customer.customerid = invoice.customerid
ORDER BY customer.customerid;
-- 7.3 RIGHT
-- Task – Create a right join that joins album and artist specifying artist name and title.
	SELECT artist.name, album.title FROM album
RIGHT JOIN
artist ON album.artistid = artist.artistid;
-- 7.4 CROSS
-- Task – Create a cross join that joins album and artist and sorts by artist name in 
-- ascending order.
	SELECT artist.name, album.title FROM album
CROSS JOIN
artist ORDER BY artist.name ASC;
-- 7.5 SELF
-- Task – Perform a self-join on the employee table, joining on the reportsto column.
SELECT * FROM employee E1, employee E2
	WHERE e1.employeeid <> e2.employeeid
	AND e1.reportsto = e2.reportsto
	ORDER BY e1.lastname;
-- 2