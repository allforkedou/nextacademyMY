Database Drill: Intro to SQLite
Now it is time to learn to store your data.

SQLite is a really simple relational database. Every database is a single file, which you can move around.

Creating a database in SQLite is simple.

sqlite3 dummy.db
Will put you into the “sqlite” shell prompt, which looks something like this:

SQLite version 3.7.13 2012-06-11 02:05:22
Enter .help"for instructions
Enter SQL statements terminated with a ;
sqlite
Adding a schema is easy too! If you wanted to create a users table, you can paste the following into the sqlite shell and hit enter :

CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  email VARCHAR(128) UNIQUE NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);
It should look like this, afterwards:

SQLite version 3.8.10.2 2015-05-20 18:17:19
Enter ".help" for usage hints.
sqlite> CREATE TABLE users (
   ...> id INTEGER PRIMARY KEY AUTOINCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL
   ...> );
sqlite>
Read this article about SQLite datatypes for more information what VARCHAR, DATETIME, etc. mean.
http://www.sqlite.org/datatype3.html

Objectives
Create a dummy database
Create your own dummy database in SQLite, and create a users schema as shown above.

Insert some data
You now have a table, so let’s insert some data! Paste the following into the sqlite shell:

INSERT INTO users
(first_name, last_name, email, created_at, updated_at)
VALUES
('Joshua', 'Teng', 'jedicoder@example.com', DATETIME('now'), DATETIME('now'));
And go ahead and get the data out of the table! Run this:

SELECT * FROM users;
Now add a new entry to the database with your own name and email. Run another select statement to see both entries.

Multi-line commands
The Sqlite3 shell is made to take multiple line commands. So if you just type in select * from users and hit enter, nothing happens. Only when you end the query with a ; and hit return does the query run.

This allows SQLite to take a multi-line INSERT statement like the one above. This primarily helps with readability, sometimes a more complex query can be hundreds of characters!

Now try adding Joshua to the database again, with the same data as above. Did you get an error - Error: column email is not unique? If so, can you track it down? Make sure all your data is there by running your select statement, and try again.

Add a column
Now add a column to the users table for “nicknames”. You’ll need to use the ALTER statement. Make sure you add the correct type for the nickname VARCHAR(64) and that it is a mandatory field - ie NOT NULL. If you make a mistake, don’t worry! Just .quit out of SQLite, delete the dummy.db file and start over again.

Make sure the schema was updated by typing .schema. Your new nickname column should appear last.

Now add a nickname for Josh (we think he likes “pookie butt”) and one for yourself. Use the UPDATE statement.

Use a select statement to see the database entries, they should include the new nicknames!

Need help? This tutorial may provide some insight.



Create, Drop, and Insert   
******************************
sqlite> CREATE TABLE test2.Cars(Id INTEGER PRIMARY KEY, Name TEXT, Price INTEGER);
sqlite> DROP TABLE
sqlite> INSERT INTO test2.Cars VALUES(1, 'Porsche', 107699);



Alter  
******************************
sqlite> CREATE TABLE Names(Id INTEGER, Name TEXT);
sqlite> ALTER TABLE Names RENAME TO NamesOfFriends;
sqlite> .schema NamesOfFriends
CREATE TABLE "NamesOfFriends"(Id INTEGER, Name TEXT);

sqlite> ALTER TABLE NamesOfFriends ADD COLUMN Email TEXT;
sqlite> .schema NamesOfFriends
CREATE TABLE "NamesOfFriends"(Id INTEGER, Name TEXT, Email TEXT);



Commands               
******************************
.tables
.databases
.show
.shell clear
.separator :
.mode column
.headers on
.width 15 18
.schema Cars
.read cars.sql
.sqlite_history

   -ascii               set output mode to 'ascii'
   -bail                stop after hitting an error
   -batch               force batch I/O
   -column              set output mode to 'column'
   -cmd COMMAND         run "COMMAND" before reading stdin
   -csv                 set output mode to 'csv'
   -echo                print commands before execution
   -init FILENAME       read/process named file
   -[no]header          turn headers on or off
   -help                show this message
   -html                set output mode to HTML
   -interactive         force interactive I/O
   -line                set output mode to 'line'
   -list                set output mode to 'list'
   -lookaside SIZE N    use N entries of SZ bytes for lookaside memory
   -mmap N              default mmap size set to N
   -newline SEP         set output row separator. Default: '\n'
   -nullvalue TEXT      set text string for NULL values. Default ''
   -pagecache SIZE N    use N slots of SZ bytes each for page cache memory
   -scratch SIZE N      use N slots of SZ bytes each for scratch memory
   -separator SEP       set output column separator. Default: '|'
   -stats               print memory stats before each finalize
   -version             show SQLite version
   -vfs NAME            use NAME as the default VFS



 SQLite expressions
******************************
sqlite> SELECT -(3-44);
41

The || operator is a string concatenation operator. It simply joins strings.
sqlite> SELECT 'wolf' || 'hound';
wolfhound

sqlite> SELECT * FROM Cars WHERE Name GLOB '*EN';
sqlite> SELECT * FROM Cars WHERE Name LIKE '%EN';
6|Citroen|21000
8|Volkswagen|21600
These two statements demonstrate that LIKE is case insensitive and GLOB is case sensitive.

sqlite> SELECT * FROM Cars WHERE Name REGEXP '^.{5}$';
3|Skoda|9000
4|Volvo|29000
The '^.{5}$' regular expression finds car names having exactly five characters.

More at http://zetcode.com/db/sqlite/expressions/



Inserting, updating, and deleting data in SQLite
******************************
sqlite> INSERT INTO Cars(Id, Name, Price) VALUES(1, 'Audi', 52642);
sqlite> INSERT INTO Cars(Name, Price) VALUES('Mercedes', 57127);
sqlite> INSERT INTO Cars VALUES(3, 'Skoda', 9000);
In this SQL statement, we did not specify any column names after the table name. In such a case, we have to supply all values.

sqlite> .nullvalue NULL
The .nullvalue command tells the SQLite to show NULL values as NULL. SQLite shows empty strings for NULL values by default.

sqlite> INSERT INTO Cars(Id) VALUES(4);
sqlite> SELECT * FROM Cars WHERE Id=4;
Id|Name|Price
4|NULL|Not available

sqlite> INSERT INTO Cars VALUES(4, 'Volvo', 29000);
Error: UNIQUE constraint failed: Cars.Id

sqlite> INSERT OR REPLACE INTO Cars VALUES(4, 'Volvo', 29000);

sqlite> INSERT OR FAIL INTO Cars VALUES(4, 'Bentley', 350000);
Error: UNIQUE constraint failed: Cars.Id

sqlite> INSERT OR IGNORE INTO Cars VALUES(4, 'Bentley', 350000);
sqlite> SELECT * FROM Cars WHERE Id=4;
Id|Name|Price
4|Volvo|29000

sqlite> CREATE TEMP TABLE Ints(Id INTEGER PRIMARY KEY, Val INTEGER);
sqlite> INSERT INTO Ints(Val) VALUES (1), (3), (5), (6), (7), (8), (6), (4), (9);
sqlite> SELECT * FROM Ints;
Id|Val
1|1
2|3
3|5
4|6
5|7
6|8
7|6
8|4
9|9

We can use the INSERT and SELECT statements together in one statement.
sqlite> CREATE TABLE Cars2(Id INTEGER PRIMARY KEY, Name TEXT, Price INTEGER);
First, we create a new table called Cars2.
sqlite> INSERT INTO Cars2 SELECT * FROM Cars;
Here we insert all data from the Cars table into the Cars2 table.
sqlite> SELECT * FROM Cars2;
Id|Name|Price
1|Audi|52642
2|Mercedes|57127
3|Skoda|9000
4|Volvo|29000

sqlite> DELETE FROM Cars2 WHERE Id=1;
We delete a row with Id 1.

sqlite> SELECT * FROM Cars2;
Id|Name|Price
2|Mercedes|57127
3|Skoda|9000
4|Volvo|29000



Updating data
******************************
sqlite> .read cars.sql
sqlite> UPDATE Cars SET Name='Skoda Octavia' WHERE Id=3;
sqlite> SELECT * FROM Cars WHERE Id=3;
3|Skoda Octavia|9000



Renaming column names
******************************
sqlite> SELECT Name, Price AS 'Price of car' FROM Cars;

Limiting data output
sqlite> SELECT * FROM Cars LIMIT 4;
sqlite> SELECT * FROM Cars LIMIT 2, 4; OR SELECT * FROM Cars LIMIT 4 OFFSET 2;
This statement selects four rows skipping the first two rows.


Constraints in SQLite
******************************
NOT NULL
sqlite> CREATE TABLE People(Id INTEGER, LastName TEXT NOT NULL, 
   ...> FirstName TEXT NOT NULL, City TEXT);

UNIQUE
sqlite> CREATE TABLE Brands(Id INTEGER, BrandName TEXT UNIQUE);

PRIMARY KEY
sqlite> DROP TABLE Brands;
sqlite> CREATE TABLE Brands(Id INTEGER PRIMARY KEY, BrandName TEXT);

FOREIGN KEY
CREATE TABLE Books(BookId INTEGER PRIMARY KEY, Title TEXT, AuthorId INTEGER, 
    FOREIGN KEY(AuthorId) REFERENCES Authors(AuthorId));
INSERT INTO Books VALUES(1,'Emma',1);
INSERT INTO Books VALUES(2,'War and Peace',2);

CHECK
sqlite> .schema Orders
CREATE TABLE Orders(Id INTEGER PRIMARY KEY, OrderPrice INTEGER CHECK(OrderPrice>0), 
Customer TEXT);

DEFAULT



Change a value
Oops. Josh was not so pleased about his new nickname after all. He’s also not so pleased that his name was spelled wrong. We need to change these things! Josh’s correctly spelled name is “Josh Teng” and he’d likely be less perturbed with a nickname like “Ninja Coder”.

Check out the tutorial for some help. You should be able to do this with a single line SQL statement!

And don’t forget to update the updated_at column. It should be the current time. (Hint: Look at the original INSERT statements.) BTW, when you get into development with Rails, the updated_at column will be managed for you.

Use a select statement to see the database entries, they should include the correct spellings and updated nickname. Nice work!

Submit your console history
Copy all your previous commands from the SQLite console, paste them in the repo, and submit!