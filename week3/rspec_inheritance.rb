require 'rspec'
require_relative 'inheritance'
describe "Inheritance" do
  it "should have 7 classes: Animal, Mammal, Amphibian, Primate, Frog, Bat & Chimpanzee." do
    expect{ Animal.new }.not_to raise_error
    expect{ Mammal.new }.not_to raise_error
    expect{ Amphibian.new }.not_to raise_error
    expect{ Primate.new }.not_to raise_error
    expect{ Frog.new }.not_to raise_error
    expect{ Bat.new }.not_to raise_error
    expect{ Chimpanzee.new }.not_to raise_error
  end

  describe "Mammal & Amphibian" do
    it "should inherit from Animal" do
      expect(Mammal).to be < Animal
      expect(Amphibian).to be < Animal
    end
  end

  describe "Primate, Chimpanzee & Bat" do
    it "should inherit from Mammal" do
      expect(Primate).to be < Mammal
      expect(Bat).to be < Mammal
      expect(Chimpanzee).to be < Mammal

    end
  end

  describe "Frog" do
    it "should inherit from Amphibian" do
      expect(Frog).to be < Amphibian
    end
  end
end

