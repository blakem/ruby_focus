require 'spec_helper'

describe Address do

    before(:each) do
      @valid = { :street  => "123 Main St.",
                 :city    => "San Francisco", 
                 :zip     => "94111",
                 :country => "America" }
    end

    it "should require a street" do
      address = Address.new(@valid.merge({ :street => "" }))
      address.should_not be_valid
      address.errors[:street].should_not be_blank
    end

    it "should require a city" do
      address = Address.new(@valid.merge({ :city => "" }))
      address.should_not be_valid
      address.errors[:city].should_not be_blank
    end

    it "should require a zip" do
      address = Address.new(@valid.merge({ :zip => "" }))
      address.should_not be_valid
      address.errors[:zip].should_not be_blank
    end

    it "should not require a country and default to USA" do
      address = Address.new(@valid.merge({ :country => "" }))
      address.should be_valid
      address.save
      address.reload
      address.country.should == "USA"
    end

end
