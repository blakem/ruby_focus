class Address < ActiveRecord::Base

  validates_presence_of :street, :city, :zip
  
  before_save :default_to_usa
  
  private
    def default_to_usa
      self.country = 'USA' if country.blank?
    end

end
