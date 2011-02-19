require 'spec_helper'

describe Person do

  before(:each) do
    @attr = { :first_name => "", :last_name => "", :middle_name => "" }
  end

  it "should require a first_name" do
    person = Person.new(@attr.merge({ :last_name => "Mills", :middle_name => "David" }))
    person.should_not be_valid
  end
  
  it "should require a last_name" do
    person = Person.new(@attr.merge({ :first_name => "Blake", :middle_name => "David" }))
    person.should_not be_valid
  end

  it "should not require a middle_name" do
    person = Person.new(@attr.merge({ :first_name => "Blake", :last_name => "Mills" }))
    person.should be_valid
  end

  it "should construct a full name from first and last" do
    person = Person.new(@attr.merge({ :first_name => "Blake", :last_name => "Mills" }))
    person.full_name.should be == "Blake Mills"
  end

  it "should construct a full name from first, middle and last" do
    person = Person.new(@attr.merge({ :first_name => "Blake", :middle_name => "David", :last_name => "Mills" }))
    person.full_name.should be == "Blake David Mills"
  end
end
