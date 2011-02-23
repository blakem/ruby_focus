require 'spec_helper'

describe Person do

  before(:each) do
    @valid = { :first_name => "Blake", :middle_name => "David", :last_name => "Mills" }
  end

  it "should require a first_name" do
    person = Person.new(@valid.merge({ :first_name => "" }))
    person.should_not be_valid
    person.errors[:first_name].should_not be_nil
  end
  
  it "should require a last_name" do
    person = Person.new(@valid.merge({ :last_name => "" }))
    person.should_not be_valid
    person.errors[:last_name].should_not be_nil
  end

  it "should not require a middle_name" do
    person = Person.new(@valid.merge({ :middle_name => "" }))
    person.should be_valid
  end

  it "should construct a full name from first and last" do
    person = Person.new(@valid.merge({ :middle_name => "" }))
    person.full_name.should be == "Blake Mills"
  end

  it "should construct a full name from first, middle and last" do
    person = Person.new(@valid)
    person.full_name.should be == "Blake David Mills"
  end
  
  it "should save correctly" do
    person = Person.new(@valid)
    person.save
    new_person = Person.find_by_id(person)
    new_person.first_name.should == "Blake"
    new_person.last_name.should == "Mills"
    new_person.middle_name.should == "David"    
  end
  
  it "should respond to addresses" do
    person = Person.new(@valid)
    person.should respond_to(:addresses)
  end
  
  it "should have addresses" do
    true    
  end
end
