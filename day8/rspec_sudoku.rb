require 'rspec'
require_relative 'sudoku'
describe "Sudoku" do
  let(:board_string) { "609238745200561398853947621486352179792614583531879264945723816328196457167485932" }
  let(:new_sudoku_object) { Sudoku.new(board_string) }
  let(:solution) { "619238745274561398853947621486352179792614583531879264945723816328196457167485932" }

  describe "initializing a new Sudoku object" do
    it "should only take in a string argument" do
      expect(new_sudoku_object).to be_a(Sudoku)
    end
  end

  describe "#solve!" do
    it "should return a string with logically necessary cells filled in" do
      expect(new_sudoku_object.solve!).to eq(solution)
    end
  end
end

