# == Schema Information
# Schema version: 20110223203908
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

  has_many :messages, :foreign_key => 'recipient_id'
  has_many :addresses

  scope :find_by_names_starting_with, lambda { |term|
    {
      :conditions => ["first_name LIKE :term or last_name LIKE :term", {:term => term +'%'}]  ,
      :order => 'last_name ASC'
    }
  }

  def full_name
    if middle_name.blank?
      "#{first_name} #{last_name}"
    else
      "#{first_name} #{middle_name} #{last_name}"
    end      
  end
end
