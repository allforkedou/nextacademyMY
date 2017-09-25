require 'rspec'
require_relative 'racer'

describe "RubyRacer" do
  let(:ruby_racer) { RubyRacer.new(['Player 1', 'Player 2']) }

  describe "#initialize" do
    it "should assign variable @players and @length" do
      expect(ruby_racer.instance_variable_get(:@players)).to eq ruby_racer.players
      expect(ruby_racer.instance_variable_get(:@length)).to eq ruby_racer.length
    end

    it "should declare variable @player_positions array" do
      expect(ruby_racer.instance_variable_get(:@player_positions)).to eq [0,0]
    end
  end

  describe "#finished?" do
    it "should return true if one of the player's position >= length of board" do
      ruby_racer.player_positions = [10,30]
      expect(ruby_racer.finished?).to eq true
    end

    it "should return false if all players' positions < length of board" do
      ruby_racer.player_positions = [10, 29]
      expect(ruby_racer.finished?).to eq false
    end
  end

  describe "#winner" do
    it "should return player that has reached the finish line" do
      ruby_racer.player_positions = [10,30]
      expect(ruby_racer.winner).to eq "Player 2"
    end

    it "should return nil if no player has reached the finish line" do
      ruby_racer.player_positions = [10,25]
      expect(ruby_racer.winner).to eq nil
    end
  end

  describe "#advance_player!" do
    it "should roll the dice" do
      expect_any_instance_of(Die).to receive(:roll)
      ruby_racer.advance_player!("Player 1")
    end

    it "should increase player position accordingly" do
      expect{ ruby_racer.advance_player!("Player 1") }.to change{ ruby_racer.player_positions }
    end
  end
end