# If you want to overwrite your database you will need
# to delete it before running this file
require 'sqlite3'

$db = SQLite3::Database.new "students.db"

module StudentDB
  def self.setup
    $db.execute( <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          gender VARCHAR(64) NOT NULL,
          birthday VARCHAR(64) NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,

          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
    SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start
    $db.execute( <<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Brick','Thornton', 'M', '1957-08-31', 'bthornton8@illinois.edu','888-888-8888', 
            DATETIME('now'), DATETIME('now')),
          ('Najib','Razak', 'M', '1950-02-26', 'najib@satumalaysia.com','111-111-1111', 
            DATETIME('now'), DATETIME('now')),
          ('Donald','Trump', 'M', '1969-06-09', 'realdonaldtrump@trump.com','666-999-6969', 
            DATETIME('now'), DATETIME('now'));
    SQL
    )
  end

  def self.add(first_name,last_name, gender, birthday, email, phone)
    $db.execute(<<-SQL
        INSERT INTO students
          (first_name, last_name, gender, birthday, email, phone, created_at, updated_at)
        VALUES
          ("#{first_name}","#{last_name}","#{gender}","#{birthday}","#{email}","#{phone}",
           DATETIME('now'), DATETIME('now'));
    SQL
    )
  end

  def self.delete(student_id)
    $db.execute(<<-SQL
        DELETE
        FROM students
        WHERE students.id = "#{student_id}";
    SQL
    )
    p "Deleted Student ID #{student_id}"
  end

  def self.show_list
    $db.execute(<<-SQL
        SELECT * FROM students;
    SQL
    ) do |row|
        p row
      end
  end

  def self.find_by_first_name(first_name)
    query = <<-SQL
        SELECT id, first_name, last_name FROM students
        WHERE students.first_name = ?;
    SQL
    $db.execute(query,first_name) do |row|
      p row
      end
  end

  #What should you use when there are two arguments
  def self.find_by_first_last_name(first_name, last_name)
    fullname = [first_name, last_name]
    query = <<-SQL
        SELECT id, first_name, last_name FROM students
        WHERE students.first_name = ? AND students.last_name = ?;
    SQL
    $db.execute(query,fullname) do |row|
      p row
      end
  end

  def self.find_by_attribute(attribute, value)
    $db.execute(<<-SQL
        SELECT id, first_name, last_name, "#{attribute}" FROM students
        WHERE "#{attribute}" = "#{value}";
    SQL
    )do |row|
      p row
      end
  end

  def self.find_by_birthday_month(month)
    $db.execute(<<-SQL
        SELECT id, first_name, last_name, birthday FROM students
        WHERE strftime('%m', birthday) = "#{month}";
    SQL
    )do |row|
      p row
    end
  end

  def self.list_by_birthday
    $db.execute(<<-SQL
        SELECT id, first_name, last_name, birthday FROM students
        ORDER BY birthday;
    SQL
    ) do |row|
        p row
      end
  end

end #DO NOT DELETE, end of StudentDB Module

#Only run the commented codes the very first time, as you don't need to setup, seed and add the same things again
# StudentDB.setup
# StudentDB.seed
# StudentDB.add("Ah", "Kaw", "male", "1999-09-11", "ahkaw99@kawkaw.com", "999-999-9999")
# StudentDB.add("Ah", "Meow", "female", "1966-06-30", "ahmeow66@kawkaw.com", "666-666-6666")
# StudentDB.show_list
# StudentDB.delete(5)
# StudentDB.show_list
# StudentDB.find_by_first_name('Donald')
# StudentDB.find_by_first_last_name('Donald','Trump')
# StudentDB.find_by_attribute('gender','M')
# StudentDB.find_by_birthday_month('06')
# StudentDB.list_by_birthday

