class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  validates :title, :content, :description, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "140x140>" }, default_url: "missing.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/}, size: { in: 0..10.megabytes }

  has_many :comments, as: :commentable, dependent: :destroy


	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |post|
	      csv << post.attributes.values_at(*column_names)
	    end
	  end
	end
end
