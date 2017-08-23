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