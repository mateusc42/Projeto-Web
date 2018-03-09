class User < ApplicationRecord
  enum role: [:user, :admin, :superadmin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
  	self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
end
