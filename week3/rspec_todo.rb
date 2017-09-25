require 'rspec'
require_relative 'todo'

describe "Task" do
  let(:task) { Task.new("Complete Ruby Challenges") }

  describe "#initialize" do
    it "should create a new Task object with attributes :title & :completed" do
      expect(task).to be_a Task
      expect(task).to respond_to :title
      expect(task.title).to eq "Complete Ruby Challenges"
      expect(task).to respond_to :completed
      expect(task.completed).to eq false
    end
  end
end

describe "List" do
  let(:list) { List.new("todo_test.csv") }
  let(:add_tasks) do
    list.add("Walk the dog")
    list.add("Complete Ruby Challenges")
  end

  before(:each) do
    File.new("todo_test.csv", "w")
    list.tasks = []
  end

  describe "#initialize" do
    it "should take in 1 argument: csv file_name" do
      expect{ List.new }.to raise_error ArgumentError
      expect{ list }.not_to raise_error
    end

    it "should create a List object with attributes :file & :tasks" do
      expect(list).to be_a List
      expect(list).to respond_to :file
      expect(list).to respond_to :tasks
    end
  end

  describe "#add" do
    it "should take in a string, create a Task object and push it into attribute :tasks" do
      prev_count = list.tasks.size
      list.add("Walk the dog")
      current_count = list.tasks.size

      expect(current_count - prev_count).to eq 1
      expect(list.tasks.last).to be_a Task
      expect(list.tasks.last.title).to eq "Walk the dog"
    end

    it "should append a new line into csv file" do
      original_rows = CSV.readlines("todo_test.csv").size
      list.add("Walk the dog")
      current_rows = CSV.readlines("todo_test.csv").size

      expect(current_rows - original_rows ).to eq 1
    end
  end

  describe "#tasks" do
    it "should return all tasks in that list" do
      add_tasks
      expect(list.tasks).to be_an Array
      expect(list.tasks.size).to eq 2
    end
  end

  describe "#delete" do
    it "should receive task number and remove from attribute :tasks array" do
      add_tasks
      prev_count = list.tasks.size
      list.delete(1)
      current_count = list.tasks.size

      expect(prev_count - current_count).to eq 1
    end

    it "should remove a line from csv file" do
      add_tasks
      original_rows = CSV.readlines("todo_test.csv").size
      list.delete(1)
      current_rows = CSV.readlines("todo_test.csv").size

      expect(original_rows - current_rows).to eq 1
    end
  end

  describe "#complete" do
    it "should receive task number and complete the task" do
      add_tasks
      list.complete(1)

      expect(list.tasks.first.completed).to eq true
    end
  end
end

