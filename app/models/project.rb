class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :tickets, dependent: :destroy
  
  validates :name , presence: true 
end