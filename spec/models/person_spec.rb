require 'spec_helper'

describe Person do

  before(:each) do
    @valid = { :first_name => "Blake", :middle_name => "David", :last_name => "Mills" }
  end

  describe "Validations" do
    [:first_name, :last_name].each do |attr|
      it "should require a #{attr}" do
        person = Person.new(@valid.merge({ attr => "" }))
        person.should_not be_valid
        person.errors[attr].should_not be_nil
      end
    end
  
    it "should not require a middle_name" do
      person = Person.new(@valid.merge({ :middle_name => "" }))
      person.should be_valid
    end
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
  
  it "makes a person from a factory" do
    p = Factory(:person)
    p.should_not be_nil
    p.should be_kind_of(Person)
  end
  
  it "should find people by partial name match" do
    jona = Factory(:person, :first_name => 'Jona', :last_name => 'Smith')
    peter = Factory(:person, :first_name => 'Peter', :last_name => 'Jones')
    bob = Factory(:person, :first_name => 'Bob', :last_name => 'Smith')

    Person.all.should include(jona, peter, bob)
    Person.find_by_names_starting_with("Jon").should include(peter, jona)
    Person.find_by_names_starting_with("Jon").should_not include(bob)
  end
  
  describe "Associations" do
    
    it "should respond to addresses" do
      Person.new.should respond_to(:addresses)
    end

    it "should have addresses" do
      addr = Factory(:address)
      addr.person.should_not be_nil
      p = addr.person
      p.addresses.should == [addr]
    end
    
    it "has messages" do
      Person.new.should respond_to(:messages)
    end
    
    it "can retrieve messages" do
      msg = Factory(:message)
      p = msg.recipient
      p.messages.should == [msg]
    end
  end
end
