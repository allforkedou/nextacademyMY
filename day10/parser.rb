# Parsing Data: CSV In, CSV Out
# When two processes on a single computer or two computers across a network want to share information they have to pre-agree on a format for exchanging data. A program running on my laptop can’t directly access the memory of some program running on yours, so they translate their internal state to/from this intermediate format first. XML, JSON, CSV, and YAML are all examples of text-based data exchange formats.

# You can think of it like a dial-up modem. Because phone_number lines were designed to transmit audio signals, my modem translates all outgoing data into an audio signal before it’s sent over the phone_number line. Your modem receives the audio signal and translates it back into data your computer can make sense of.

# If heaven forbid you’ve never heard what this sounds like, enjoy this video. That’s the sound of DATA .

# You’ll be receiving, transforming, and forwarding data like this all the time in every program you write, so it’s important to get used to it. We’re going to start with a CSV file.

# Objectives
# The overall objective here is to learn to manipulate CSV data and objects as part of a single application. This is a common pattern in software engineering as per the above: change the representation of data from format A to format B to make it easier to do X with it.

# Consider, for example, that trying to manipulate CSV data as pure text could get pretty tricky. Say you wanted to filter out a list of first names from the CSV file that started with the letter “A” or even find all people who had similar last names in area code 415 — how would you do that?

# What if the contents of the CSV file was instead represented as objects in your program. Couldn’t you then just use Enumerable#select or similar methods to grab just the records that matched your search criteria?

# These next few steps will walk you through the core part of this process — getting data out of the file and turning it into a bunch of objects you can manipulate in your program and then save them back to the file.

# Person and PersonParser

# First, make sure you have a copy of the CSV file from the gist. It contains a few hundred rows of random data about people.

# Create a Person class such that each row of the CSV file represents a particular instance of the Person class. What attributes should a Person object have?

# Create a PersonParser class that is initialized with the name of a CSV file. Then use Ruby’s built-in CSV class to implement a PersonParser#people method that returns an Array of properly-parsed Persons, based on the data in the CSV file. Say that three times fast.

# Note: CSV is a “built-in” class, but you still need to require it at the top of your program.

# Manipulating in Ruby, Saving to CSV

# Create a PersonParser#add_person method which takes a new Person instance as its input and appends that instance to the parser’s internal @people array.

# Next, create a PersonParser#save method which uses the CSV class to save the current state of the parser to a new CSV file. For example:

# parser = PersonParser.new('people.csv')
# parser.add_person( Person.new(...) )

# # This will now write to people.csv, but there will be one more row
# # corresponding to the extra Person you just added.
# parser.save
# Note: When you read and write to a file, you can choose a format (like “r” for read and “w” for write). The CSV formats are the same as the file formats.

# Translating from CSV-land to Ruby-land

# Because text-based data formats don’t know anything about where your data is going to be used, there aren’t easy ways to encode language-specific features into the format. For example, the people.csv file has a created_at field. In a CSV this is just a conveniently-formatted string, but in Ruby we might want it to be an instance of the DateTime class.

# At the top of your Ruby program add the line:

# require 'date'
# Instead of storing Person#created_at as a String, use the DateTime#parse method to parse the String into an actual honest-to-goodness DateTime object.
require 'csv'
require 'date'

class Person
  # Look at the CSV file
  # What attributes should a Person object have?
  attr_reader :id, :first_name, :last_name, :email, :phone_number
  attr_accessor :created_at
  def initialize(**info)
    @id = info[:id]
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @email = info[:email]
    @phone_number = info[:phone_number]
    @created_at = info[:created_at]
    if(@created_at.nil?)
      @created_at = DateTime.now
    end
  end

end #DO NOT DELETE, it's Person class's end

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
    @people = nil
  end

  def people
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    #if @people is nil, then it is false, else it is true and will return @people
    return @people if @people

    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
    parsed = []
    CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
      parsed << Person.new({
        :id => row[:id],
        :first_name => row[:first_name],
        :last_name => row[:last_name],
        :email => row[:email],
        :phone_number => row[:phone_number],
        :created_at => DateTime.parse(row[:created_at])
      })
    end
      @people = parsed
      return @people
  end

  def add_person(person)
    @people << person
  end

  def save
    CSV.open("people.csv", "wb", {:write_headers=>true, :headers => [:id,:first_name,:last_name,:email,:phone_number,:created_at]}) do |csv|
      @people.each do |person|
        csv << [person.id, person.first_name, person.last_name, person.email, person.phone_number, person.created_at]
      end
    end
  end

#     def save
#     CSV.open("people_parsed.csv", "wb", {:write_headers=>true, :headers => [:id,:first_name,:last_name,:email,:phone_number,:created_at]}) do |csv|
#       @people.each do |person|
#         csv << [person.id, person.first_name, person.last_name, person.email, person.phone_number, person.created_at]
#       end
#     end
#   end

end #<-- DO NOT DELETE, it's class PersonParser's end

# # Testcase
# parser = PersonParser.new('people.csv')
# puts "There are #{parser.people.size} people in the file '#{parser.file}'." #200

# ahkao = Person.new(id: 201, first_name: "Kao", last_name: "Lat", email: "kaolat996@gmail.com", phone_number: "96996")
# parser.add_person(ahkao)
# puts "There are #{parser.people.size} people in the file '#{parser.file}'." #201

# parser.save


