class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  has_many :appointments
  has_many :events, through: :appointments

  # Validate
  #validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end