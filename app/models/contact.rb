require_relative '../../db/config'

# implement your Contact model here
class Contact < ActiveRecord::Base
  validates :company, :presence => true
  validates_format_of :phone, :with => /\(?\d{3}\)?-?\s?\d{3}\-\d{4}/
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  def name
    first_name + " " + last_name 
  end

  def area_code
    phone[1..3] #assuming number is given as "(xxx) xxx-xxxx"
    #can also use .match and regex to filter the first 3 digits .match(/\d{3}(?=\))/)...assuming no 1in front of ()
    # use (/^[1\D]+?(\d{3})\)?/) if there is a one...thankfully theres no area codes that start with a 1 :D.
  end
end