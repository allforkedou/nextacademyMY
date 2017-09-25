require 'rspec'
require_relative 'flashcards'
describe "Ruby Flashcards" do
  it "should have at least these classes: Card & Deck" do
    expect{ Card }.not_to raise_error
    expect{ Deck }.not_to raise_error
  end
end