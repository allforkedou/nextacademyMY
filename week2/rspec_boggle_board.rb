require 'rspec'
require_relative 'boggle_board'
describe "BoggleBoard" do
  let(:board) { BoggleBoard.new }

  describe "#initialize" do
    it "should declare variable @board with 4x4 nested array" do
      @board = board.instance_variable_get(:@board)
      expect(@board).to be_an Array
      expect(@board.size).to eq 4
      expect(@board[0]).to be_an Array
      expect(@board[0].size).to eq 4
    end
  end

  describe "#shake!" do
    it "should fill @board with random upper-case alphabets A-Z" do
      board.shake!
      @board = board.instance_variable_get(:@board)
      x = rand(0..3)
      y = rand(0..3)
      expect( ("A".."Z").to_a ).to include @board[x][y]
    end
  end
end