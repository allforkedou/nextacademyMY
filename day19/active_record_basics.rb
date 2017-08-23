***** ActiveRecord basics *****
CREATION
- new & save
student = Student.new
student.name = "kevin"
student.age = 18
student.save # => true/false

- create
student = Student.create(name: 'kevin', age: 18)


READ
Student.all # gives all student
Student.find(5)
Student.find_by(email: 'kevin@handsome.com')
Student.where(age: 21)
Student.where('age <= ?', 21)


UPDATE
s2 = Student.find_by(name: 'Kevin')
s2.update(name: 'Sheng', age: 5)


DESTROY
s3 = Student.find_by(name: 'Sheng')
s3.destroy

Student.count
Student.last
Student.second

#table name is always plural
#class name is always singular

#Tutorial codes from Lecture
#irb load 'playground.rb'
#irb -r ./playground.rb
#Find by gives only one matched object, where gives array
#Student.find(11) #11 is the ID
#Student.find_by(email: "ciara_wolf@towne.io")
#Student.where(age: 21)
#Student.where('age <= ?', 21)
# Student.where(age: 21).count
#Student.all
#student = Student.new #This creates new student object not in database yet
#s2 = Student.find_by(name: 'Kevin')
# s2.email = 'kevin@handsome.com'
# s2.save
# s3 = Student.second
# s3.update(age: 50, name: 'yusheng', email: 'haha@gmail.com')
# s4 = Student.find_by(email:'kevin@handsome.com')
# s4.destroy
# s4 = Student.find_by(email:'kevin@handsome.com') #nil
# s4 = Student.where(email:'kevin@handsome.com') #empty array
# Student.destroy(1) #Assuming you know the id
