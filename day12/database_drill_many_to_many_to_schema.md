
Time
~ 30 minutes
Learning Goals	
Understanding many-to-many database relationships
Many-to-many relationships are relatively easy to understand, but slightly more complicated to implement. For example, an author can write many books, and a book can be written by many authors. We model this relationship by creating a join table . It looks like this:

Alt text

Here authors_books is the join table and it tells us which authors wrote which books. The actual data about each author and each book is stored in one place: the authors and books tables, respectively.

If you want, you can read about database normalization in Wikipedia or this decent article from Microsoft. The goal of normalization is to remove data redundancy.

Objectives
Implement the schema
Implement the above author/book schema in the SQL Schema Designer.Remember to add the appropriate foreign keys!

Use SQL Schema Designer, recreate this table yourself. When you are done, take a screenshot of your final schema design, and save it in your laptop for future reference. If you feel unsure about your database design, please feel free to check with a mentor.

Add more fields
Each book also has one publisher, and a publisher can publish many books. Add a publishers table to the schema above so it and books are in a one-to-many relationship.

The publishers table should have a name field, in addition to the fields we include by convention (primary key, timestamps, etc.).
