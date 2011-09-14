class Rental < ActiveRecord::Base
belongs_to :country
belongs_to :film
has_many :box_offices,:order=>:created_at,:dependent=>:destroy
validates :data_start, :inclusion=>{:in=>Date.parse("12.06.1986")..Date.parse("12.09.2012")},:presence=>true
validates :film_id,:presence => true
validates :country_id,:presence => true,:uniqueness=>{:scope=>:film_id}

def er
errors.add(:data_finish, "Разница между датами должна быть больше недели")
end

end
