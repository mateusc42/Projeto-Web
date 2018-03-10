class Post < ApplicationRecord
  belongs_to :user
  validates :title, :content, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "140x140>" }, default_url: "missing.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/}, size: { in: 0..10.megabytes }

  has_many :comments, as: :commentable, dependent: :destroy
end
