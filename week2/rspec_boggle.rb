require 'rspec'
require_relative 'boggle'
describe "BoggleBoard (4x4)" do
  let(:board) { BoggleBoard.new }
  before(:each) { board.shake! }

  describe "#include?" do
    it "should return true if board contains word" do
      shaken_board = board.instance_variable_get(:@board)
      word = shaken_board[rand(0..3)].join
      expect(board.include?(word)).to eq true
    end

    it "should return false if board does not contain word" do
      word = "RIDICULOUS"
      expect(board.include?(word)).to eq false
    end
  end
end

describe "BoggleBoard (16x1)" do
  let(:board) { BoggleBoard.new }
  before(:each) { board.shake! }

  describe "#include?" do
    it "should return true if board contains word" do
      shaken_board = board.instance_variable_get(:@board)
      word = shaken_board[0..3].join
      expect(board.include?(word)).to eq true
    end

    it "should return false if board does not contain word" do
      word = "RIDICULOUS"
      expect(board.include?(word)).to eq false
    end
  end
end