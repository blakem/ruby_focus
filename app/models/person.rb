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
  # attr_accessible :first_name, :last_name, :middle_name
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  def full_name
    if middle_name.blank?
      "#{first_name} #{last_name}"
    else
      "#{first_name} #{middle_name} #{last_name}"
    end      
  end

end
