# == Schema Information
# Schema version: 20110219015317
#
# Table name: people
#
#  id          :integer         not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  middle_name :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  def full_name
    if middle_name.blank?
      "#{first_name} #{last_name}"
    else
      "#{first_name} #{middle_name} #{last_name}"
    end      
  end
  
  def self.find_by_names_starting_with(term)
    Person.all(:conditions => ["first_name LIKE :term or last_name LIKE :term", {:term => term +'%'}],
               :order => 'last_name ASC')
  end
  
  def addresses
    "Bob"
  end

end
