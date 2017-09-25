
Time
~ 30 minutes
Learning Goals	
Understanding databases
Learn about database naming convention
Learn how to design a database schema
In the next few challenges, we will be taking a break from Ruby and explore databases.

So what is a database? A database can be thought of as “an organized collection of data”. Basically your data is collected systematically in some sort of container which has a certain structure. 

The following table shows a text representation of a database for structued data. It looks like an Excel spreadsheet, really. 

id	first_name	last_name	gender	birthday	email	phone
1	Bruce	Lee	male	1998-12-24	bruce@example.com	(03) 123-4567
2	Jacky	Chan	male	1997-01-29	jacky@example.com	(05) 436-2633
3	Emma	Watson	female	1997-10-30	emma@example.com	1-351-672-6358x02502
4	Taylor	Swift	female	1995-06-27	taylor@example.com	(600)142-5639x9380
5	MinHo	Lee	male	1997-04-04	minho@example.com	554.170.3265
Notice that each column or field has a name. We can describe the structure of this table independently of what data is in it. We’d write the structure like this:

+------------+
| students   |
+------------+
| id         |
| first_name |
| last_name  |
| gender     |
| birthday   |
| email      |
| phone      |
+------------+
Conventions

Naming conventions are important in programming. It increases code readability and provides a standard that everyone in your team can follow. Naming conventions are common in database design too, depending on the database that you use. In this bootcamp, you will be learning about SQL and hence we will be following the naming conventions for it.

The following is a summary of what it comes to naming your table and the fields (or columns) in the table:

Pluralize table names, e.g., “students,” “products,” “todos,” etc.
We use snake_case_like_this to name fields, rather than camelCaseLikeThis - the latter looks weird and out of place in Ruby.
Each row is uniquely identified by an automatically-incrementing integer field called id. ActiveRecord migrations do this for you automatically, but you’ll have to be explicit when designing your tables by hand.
Fields that involve dates or times end in _at or _on (created_at, updated_at, completed_at, etc.) unless it’s really obvious they already refer to something time-related. We’d say birthday rather than born_on, for example.
When in doubt, make your field and table names as self-explanatory as possible. Avoid field names like type, kind, status, etc. They could refer to anything! Err on the side of clarity, even if it seems verbose. Other coders will appreciate it, and computers don’t care if your field name is 20 characters long rather than 5 characters long.
Rails includes created_at and updated_at fields by default, which record when a row is first added to a table and when it was last updated. This is good record-keeping, so we’ll generally include the same fields in our tables.
Primary Keys
Each row in a database table should have a primary key . This is a field (or collection of fields) which uniquely identify that row from all other rows. Rails defaults to using a synthetic primary key , which is just an arbitrary, auto-incrementing integer usually denoted by the field name id. It’s called “synthetic” because it doesn’t have any inherent meaning.

The assumption that the primary key is an auto-incrementing integer called id is baked deeply into Rails. Most web apps follow this convention, and we will, too.
Objectives
Design the schema

Visit the SQL Schema Designer and recreate the students table above.

In SQL Designer, you’ll notice that you can pick a “type” for each field. For example, the birthday field should be a “date” type. There’s a core set of datatypes that all SQL-based databases support, but many have additional types. You can read more about that at w3schools.com or on Wikipedia.

This is what the  should look like, colors and all.

Use SQL Schema Designer, recreate this table yourself. When you are done, take a screenshot of your final schema design, and save it in your laptop for future reference. If you feel unsure about your database design, please feel free to check with a mentor.
