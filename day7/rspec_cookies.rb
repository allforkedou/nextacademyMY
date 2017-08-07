require 'rspec'
require_relative 'cookies'

describe "Cookie" do
  describe "#initialize" do
    it "takes 2 arguments: type and baking_time" do
      expect{ Cookie.new }.to raise_error ArgumentError
      expect{ Cookie.new("Chocolate Chip") }.to raise_error ArgumentError
      expect{ Cookie.new(10) }.to raise_error ArgumentError
      expect{ Cookie.new("Chocolate Chip", 10) }.not_to raise_error
    end

    it "has attribute :type and :status" do
      expect( Cookie.new("Chocolate Chip", 10) ).to respond_to :type
      expect( Cookie.new("Chocolate Chip", 10) ).to respond_to :status
    end

    it "returns Cookie object" do
      expect(Cookie.new("Chocolate Chip", 10)).to be_a Cookie
    end
  end
end

describe "Oven" do
  describe "#initialize" do
    it "returns Oven object" do
      expect(Oven.new).to be_an Oven
    end
  end

  describe "#bake" do
    it "takes 2 arguments: cookie and timer" do
      oven = Oven.new
     cookie = Cookie.new("Chocolate Chip", 10)
      expect{ oven.bake }.to raise_error ArgumentError
      expect{ oven.bake(cookie, 10) }.not_to raise_error
    end

    it "changes status of cookie to burnt if time_to_bake > cookie.baking_time" do
      oven = Oven.new
      cookie = Cookie.new("Chocolate Chip", 10)
      expect{ oven.bake(cookie, 12) }.to change{ cookie.status }.from(:doughy).to(:burnt)
    end
  end
end

