require 'spec_helper'

describe Message do

  describe "validations" do
    before(:each) do
      @m = Message.new
      @m.should_not be_valid
    end
    
    %w(sender recipient subject).each do |attr|
      it "must have #{attr}" do
        @m.errors[attr].should_not be_nil
      end
    end
  end
  
  describe "Associations" do

    it "belongs to a sender" do
      Message.new.should respond_to(:sender)      
    end

    it "belongs to a recipient" do
      Message.new.should respond_to(:recipient)      
    end    

    it "can retrieve a sender and that is a Person object" do
      msg = Factory(:message)
      msg.sender.should_not be_nil
      msg.sender.should be_kind_of(Person)      
    end

    it "can retrieve a recipient and that is a Person object" do
      msg = Factory(:message)
      msg.recipient.should_not be_nil
      msg.recipient.should be_kind_of(Person)      
    end
  end
end
