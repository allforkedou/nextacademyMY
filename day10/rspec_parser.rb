require 'rspec'
require_relative 'parser'
describe "Person" do
  let(:person) { Person.new(id: 201, first_name: "Jane", last_name: "Doe", email: "jane_doe@gmail.com", phone_number: "2020202") }

  it "should have attributes: id, first_name, last_name, email, phone_number, created_at" do
    expect(person.id).not_to be_nil
    expect(person.first_name).not_to be_nil
    expect(person.last_name).not_to be_nil
    expect(person.phone_number).not_to be_nil
    expect(person.email).not_to be_nil
    expect(person.created_at).not_to be_nil
  end
end

describe "PersonParser" do
  let(:parser) { PersonParser.new("people.csv") }
  let(:person) { Person.new(id: 201, first_name: "Jane", last_name: "Doe", email: "jane_doe@gmail.com", phone_number: "2020202") }

  describe "#people method" do
    it "should return an array of Person objects" do
      expect(parser.people).to be_an Array
      random_person = parser.people.sample
      expect(random_person).to be_a Person
      expect(random_person.instance_variables).to eq [:@id, :@first_name, :@last_name, :@email, :@phone_number, :@created_at]
    end
  end

  describe "#add_person method" do
    it "should take in a Person object" do
      parser.people
      expect{ parser.add_person }.to raise_error ArgumentError
      expect{ parser.add_person(person) }.not_to raise_error
    end

    it "should increase @people array by 1" do
      parser.people
      initial_count = parser.people.size
      parser.add_person(person)
      current_count = parser.people.size
      expect( current_count - initial_count ).to eq 1
    end
  end

  describe "#save method" do
    it "should save all @people into csv file" do
      original_rows = File.readlines("people.csv").size
      parser.people
      parser.add_person(person)
      parser.save
      current_rows = File.readlines("people.csv").size
      expect(current_rows - original_rows).to eq 1

      # clean up so that there're no confusion for students
      parser.people.delete_at(-1)
      parser.save
    end
  end
end