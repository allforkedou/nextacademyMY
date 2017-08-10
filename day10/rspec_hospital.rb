require 'rspec'
require_relative 'hospital'

describe "Hospital Interface" do
  it "should at least have these classes: Hospital, Patient, Employee" do
    expect{ Hospital }.not_to raise_error
    expect{ Patient }.not_to raise_error
    expect{ Employee }.not_to raise_error
  end
end