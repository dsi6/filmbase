class Country < ActiveRecord::Base
  default_scope order(:name)

  has_many :films,:order=>'name' 
  
  has_many :rentals 

  validates :name,:presence => true,:uniqueness => true
end
