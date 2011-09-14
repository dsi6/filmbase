class BoxOffice < ActiveRecord::Base

belongs_to :rental
validates :rental_id,:presence => true
validates :number_week,:presence => true, :numericality => {:only_integer=>true,:greater_than=>0}, :inclusion => {:in => 1..52},:uniqueness=>{:scope=>:rental_id}
validates :sum_all,:presence => true,:numericality => {:only_integer=>true,:greater_than=>0}

end
