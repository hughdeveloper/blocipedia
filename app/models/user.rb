class User < ApplicationRecord


  enum role: [:free, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :username, uniqueness: true

  has_many :wikis

  private

  def set_default_role
    self.role ||= :free
  end

end
