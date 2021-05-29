class User < ApplicationRecord

  has_secure_password

  validates  :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  has_and_belongs_to_many :projects
  
  def name=(value)
    return nil if value.blank?
    self.first_name, self.last_name = value.split(" ")
  end

  def name 
    return nil if self.first_name.blank?
    "#{self.first_name} #{self.last_name}"
  end 

end
