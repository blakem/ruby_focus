require 'spec_helper'

describe Address do

    before(:each) do
      @valid = { :street  => "123 Main St.",
                 :city    => "San Francisco", 
                 :zip     => "94111",
                 :country => "America" }
    end

    describe "Validations" do
      [:street, :city, :zip].each do |attr|
        it "should require a #{attr}" do
          address = Address.new(@valid.merge({ attr => "" }))
          address.should_not be_valid
          address.errors[attr].should_not be_nil
        end
      end
    end

    describe "When country is missing" do
      it "should not require a country and default to USA" do
        address = Address.new(@valid.merge({ :country => "" }))
        address.country.should be_blank
        address.should be_valid
        address.save
        address.country.should == "USA"
      end
    end
end
