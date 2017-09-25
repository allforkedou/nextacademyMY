require 'rspec'
require_relative 'atm_argv'
require_relative 'calc_argv'
require_relative 'pig_latin_argv'

describe "pig_latin_argv.rb" do
  context "when executing $ruby pig_latin_argv.rb i love baseball" do
    it "should print \"i ovelay aseballbay\"" do
      regex = /i ovelay aseballbay/
      expect( %x(ruby pig_latin_argv.rb i love baseball) ).to match regex
    end
  end

  context "when executing $ruby pig_latin_argv.rb hello world" do
    it "should print \"ellohay orldway\"" do
      regex = /ellohay orldway/
      expect( %x(ruby pig_latin_argv.rb ellohay orldway) ).to match regex
    end
  end
end

describe "calc_argv.rb" do
  context "when executing $ruby calc_argv.rb \"3 + 4\"" do
    it "should print \"7\"" do
      regex = /7/
      expect( %x(ruby calc_argv.rb \"3 + 4\") ).to match regex
    end
  end

  context "when executing $ruby calc_argv.rb \"50 * 6\"" do
    it "should print \"300\"" do
      regex = /300/
      expect( %x(ruby calc_argv.rb \"50 * 6\") ).to match regex
    end
  end
end

describe "atm_argv.rb" do
  context "when executing $ruby atm_argv.rb add 10" do
    it "should print \"Your balance is now 20 dollars\"" do
      regex = /Your balance is now 20 dollars/
      expect( %x(ruby atm_argv.rb add 10) ).to match regex
    end
  end

  context "when executing $ruby atm_argv.rb withdraw 10" do
    it "should print \"Your balance is now 0 dollars\"" do
      regex = /Your balance is now 0 dollars/
      expect( %x(ruby atm_argv.rb widthdraw 10) ).to match regex
    end
  end
end