require 'sqlite3'

$db = SQLite3::Database.new "contacts.db"

module ContactsGroupsDB
	def self.setup
	    contacts_query =
	  	<<-SQL
			CREATE TABLE contacts (
			  id INTEGER PRIMARY KEY AUTOINCREMENT,
			  first_name VARCHAR(64) NOT NULL,
			  last_name VARCHAR(64) NOT NULL,
			  address VARCHAR(64) NOT NULL,
			  phone_number VARCHAR(64) NOT NULL,
			  email VARCHAR(64) NOT NULL,
			  created_at DATETIME NOT NULL,
	          updated_at DATETIME NOT NULL
			);
	    SQL

	    groups_query = 
	  	<<-SQL
			CREATE TABLE groups (
			  id INTEGER PRIMARY KEY AUTOINCREMENT,
			  name VARCHAR(64) NOT NULL,
			  created_at DATETIME NOT NULL,
	          updated_at DATETIME NOT NULL
			);
	    SQL

	    groups_contacts_query =
	  	<<-SQL
			CREATE TABLE groups_contacts (
			  id INTEGER PRIMARY KEY AUTOINCREMENT,
			  group_id INTEGER NOT NULL,
			  contact_id INTEGER NOT NULL,
			  created_at DATETIME NOT NULL,
	          updated_at DATETIME NOT NULL,
	          # unique (group_id, contact_id)
			);
	    SQL

	    $db.execute(contacts_query)
	    $db.execute(groups_query)
	    $db.execute(groups_contacts_query)
	end

	def self.seed
		seed_contacts_query =
		<<-SQL
			INSERT INTO contacts
				(first_name, last_name, address, phone_number, email, created_at, updated_at)
			VALUES
				('Donald','Trump', 'Trump Tower, NY','666-999-6969', 'realdonaldtrump@trump.com',
	            DATETIME('now'), DATETIME('now'));
		SQL

		seed_groups_query = 
		<<-SQL
			INSERT INTO groups
				(name, created_at, updated_at)
			VALUES
				('Billionaires Club',DATETIME('now'), DATETIME('now'));
		SQL
	    $db.execute(seed_contacts_query)
	    $db.execute(seed_groups_query)
	end
end #DO NOT DELETE, END OF MODULE

class Contacts
	def initialize
		#NOTHING HERE
	end

	def add(first_name, last_name, address, phone_number, email)
		arr = [first_name, last_name, address, phone_number, email]
		add_contact_query =
		<<-SQL
		INSERT INTO contacts
			(first_name, last_name, address, phone_number, email, created_at, updated_at)
		VALUES
			(?,?,?,?,?,
	        DATETIME('now'), DATETIME('now'));
	    SQL
	    $db.execute(add_contact_query,arr)
	end

	def change_address (new_add, contact_id)
		arr = [new_add, contact_id]
		change_address_query = 
		<<-SQL
			UPDATE contacts
			SET address = ?,
				updated_at = DATETIME('now')
			WHERE id = ? ;
	    SQL
		$db.execute(change_address_query,arr)
	end

	def delete(contact_id)
		delete_contact_query = 
		<<-SQL
		DELETE
		FROM contacts
		WHERE contacts.id = ?;
		SQL
		$db.execute(delete_contact_query,contact_id)
	end

	def join_group(contact_id, group_id)
		arr = [contact_id, group_id]
		join_group_query =
		<<-SQL
		INSERT INTO groups_contacts
			(contact_id, group_id, created_at, updated_at)
		VALUES
			(?, ?, DATETIME('now'), DATETIME('now'));
	    SQL
	    $db.execute(join_group_query,arr)
	end

	def show
	$db.execute(
	<<-SQL
        SELECT * FROM contacts;
    SQL
    ) do |row|
    	p row
      end
	end
end #DO NOT DELETE, END OF class Contact

class Groups
	def initialize
		#NOTHING HERE
	end
	def add (name)
		add_group_query =
		<<-SQL
		INSERT INTO groups
			(name, created_at, updated_at)
		VALUES
			(?, DATETIME('now'), DATETIME('now'));
	    SQL
		$db.execute(add_group_query, name)
	end

	def delete (group_id)
		delete_group_query = 
		<<-SQL
		DELETE
		FROM groups
		WHERE groups.id = ?;
		SQL
		$db.execute(delete_group_query,group_id)
	end

	def show
	$db.execute(
	<<-SQL
        SELECT * FROM groups;
    SQL
    ) do |row|
    	p row
      end
	end
end #DO NOT DELETE, END OF class Group

# ContactsGroupsDB.setup
# ContactsGroupsDB.seed
contacts = Contacts.new
# contacts.add('Ah', 'Kaw', 'Dog Street', '999-999-9999', 'ahkaw99@dog.com')
# contacts.add('Ah', 'Meow', 'Cat Street', '666-666-6666', 'ahmeow66@cat.com')
# contacts.add('Ah', 'Moo', 'Cow Street', '111-111-1111', 'ahmoo11@cow.com')
# contacts.change_address('Cat Plaza', 3)
contacts.show
groups = Groups.new
# groups.add('CatDog United')
groups.show
# contacts.join_group(1,1)
# contacts.join_group(2,2)
# contacts.join_group(3,2)
# contacts.join_group(1,2)


# Will continue working on DELETE GROUP
#####################

