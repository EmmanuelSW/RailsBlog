class Article < ActiveRecord::Base
	
	has_many :comments
	belongs_to :user

	validates :title, presence:true, length: { in: 8..60 }
	validates :body, presence:true, length: { in: 60..255 }
	before_save :set_visits_count
	after_create :save_categories

	has_attached_file :cover, styles: { medium: "1280x720", thumb: "546x240" }
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	def categories=(value)
		@categories = value
	end

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private

	def save_categories
		@categories.each do |category_id|
			HasCategory.create(category_id: category_id, article_id: self.id)
		end
	end

	def set_visits_count
		self.visits_count ||= 0
	end

end
