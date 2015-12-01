class Category < ActiveRecord::Base

	validates :name , presence: true, length: { in: 3..40 }

end
