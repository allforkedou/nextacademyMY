require 'rspec'
require_relative 'house'

describe "House" do
  let(:house) { House.new(square_feet: 2000) }
  describe "#initialize" do

    it "should take a named argument" do
      expect{ House.new }.not_to raise_error
      expect{ House.new(address: "Glomac Damansara") }.not_to raise_error
      expect{ House.new("Glomac Damansara", 2000) }.to raise_error ArgumentError
    end

    it "should declare default values for @sold" do
      house = House.new(address: "Glomac Damansara",
                        square_feet: 2000,
                        num_bedrooms: 3,
                        num_baths: 2,
                        cost: 500000,
                        down_payment: 0.2,
                        has_tenants: true
                       )
      expect(house.sold).not_to be_nil
    end
  end
end

