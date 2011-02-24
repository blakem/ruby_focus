# == Schema Information
# Schema version: 20110223203908
#
# Table name: messages
#
#  id           :integer         not null, primary key
#  sender_id    :integer
#  recipient_id :integer
#  subject      :string(255)
#  body         :text
#  read_at      :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Message < ActiveRecord::Base

  belongs_to :sender, :class_name => "Person"
  belongs_to :recipient, :class_name => "Person"
   
  validates_presence_of :sender, :recipient, :subject
end
