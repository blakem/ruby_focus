# == Schema Information
# Schema version: 20110223203908
#
# Table name: addresses
#
#  id         :integer         not null, primary key
#  street     :string(255)
#  city       :string(255)
#  zip        :string(255)
#  country    :string(255)
#  person_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Address < ActiveRecord::Base

  validates_presence_of :street, :city, :zip

  belongs_to :person
  
  before_save :default_to_usa
  
  private
    def default_to_usa
      self.country = 'USA' if country.blank?
    end

end
