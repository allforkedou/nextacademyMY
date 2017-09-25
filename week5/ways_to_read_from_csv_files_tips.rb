#Way 1
require 'csv'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      senator = Senator.new
      row.each do |field, value|
        # TODO: begin
        # raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
        senator[field] = value
        # TODO: end
      end
      senator.save
    end
  end
end

#Way 2
require_relative '../app/models/student'

module StudentsImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/students.csv")
    field_names = nil
    Student.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          student = Student.create!(attribute_hash)
        end
      end
    end
  end
end