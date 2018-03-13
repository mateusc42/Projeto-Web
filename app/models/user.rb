class User < ApplicationRecord
  acts_as_paranoid
  enum role: [:user, :admin, :superadmin, :guest]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
  	self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: {conditions: ->{with_deleted}}
  validates :name, presence: true
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
end
