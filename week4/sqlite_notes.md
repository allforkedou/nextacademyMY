# write your SQL statements here and paste them into the terminal below
sqlite> CREATE TABLE users(
   ...> id INTEGER PRIMARY KEY AUTOINCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL
   ...> );
sqlite> ALTER TABLE users ADD COLUMN nickname;
sqlite> SELECT * FROM users;
sqlite> INSERT INTO users
   ...> (first_name, last_name, email, created_at, updated_at)
   ...> VALUES
   ...> ('Joshua', 'Teng', 'jedicoder@example.com', DATETIME('now'), DATETIME('now'));
sqlite> UPDATE users SET nickname='Richigga' WHERE Id=1;
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at           nickname  
----------  ----------  ----------  ---------------------  -------------------  -------------------  ----------
1           Joshua      Teng        jedicoder@example.com  2017-08-18 06:58:37  2017-08-18 06:58:37  Richigga  
sqlite> UPDATE users SET nickname='Ninja Coder', 
   ...> first_name = 'Josh',
   ...> updated_at = DATETIME('now')
   ...> WHERE id=1;
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at           nickname   
----------  ----------  ----------  ---------------------  -------------------  -------------------  -----------
1           Josh        Teng        jedicoder@example.com  2017-08-18 06:58:37  2017-08-18 07:02:08  Ninja Coder