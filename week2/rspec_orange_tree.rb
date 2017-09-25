require 'rspec'
require_relative 'orange_tree'

def should_have_attr_accessor(obj, column_name)
  file = File.read "orange_tree.rb"
  expect(file).to match(/attr_accessor.+#{column_name}/), "expected attr_accessor for #{column_name}, but got none"

  writer = column_name.to_s + "="
  expect(obj).to respond_to column_name
  expect(obj).to respond_to writer.to_sym
end

def should_have_attr_reader(obj, column_name)
  file = File.read "orange_tree.rb"
  expect(file).to match(/attr_reader.+#{column_name}/), "expected attr_reader for #{column_name}, but got none"

  expect(obj).to respond_to column_name
end

describe "Orange" do
  let(:orange) { Orange.new }

  it "should have attr_reader :diameter" do
    should_have_attr_reader(orange, :diameter)
  end

  describe "#initialize" do
    it "should return a new orange object" do
      expect(orange).to be_an_instance_of Orange
    end

    it "should assign @diameter with an integer" do
      expect(orange.instance_variable_get(:@diameter)).not_to eq nil
    end
  end
end

describe "OrangeTree" do
  let(:tree) { OrangeTree.new }

  describe "#initialize method" do
    it "should assign @height, @age & @num_of_oranges" do
      expect(tree.instance_variable_get(:@height)).not_to eq nil
      expect(tree.instance_variable_get(:@age)).not_to eq nil
      expect(tree.instance_variable_get(:@num_of_oranges)).not_to eq nil
    end
  end

  describe "#height method" do
    it "should return tree's current height" do
      expect(tree.height).to be_a Integer
    end
  end

  describe "#age method" do
    it "should return tree's current age" do
      expect(tree.age).to be_a Integer
    end
  end

  describe "#age! method" do
    it "should increase tree's current age by 1" do
      prev_age = tree.age
      tree.age!
      current_age = tree.age
      expect(current_age - prev_age).to eq 1
    end
  end

  describe "#dead? method" do
    it "should return true/false" do
      expect([true, false]).to include tree.dead?
    end
  end

  describe "#any_oranges? method" do
    it "should return true/false" do
      expect([true, false]).to include tree.any_oranges?
    end
  end

  describe "#pick_an_orange! method" do
    it "should return an Orange and reduce @num_of_oranges if there are oranges in the tree" do
      tree.age! until tree.any_oranges?
      initial_oranges = tree.instance_variable_get(:@num_of_oranges)
      expect(tree.pick_an_orange!).to be_an Orange
      expect(tree.instance_variable_get(:@num_of_oranges)).to eq(initial_oranges - 1)
    end

    it "should raise NoOrangesError if there are no oranges on the tree" do
      expect{ tree.pick_an_orange! }.to raise_error NoOrangesError
    end
  end
end

