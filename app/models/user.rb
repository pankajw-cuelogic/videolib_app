class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:first_name, presence: true, length: { minimum: 2 , maximum: 50})

  validates(:email, 
  	presence: true,
  	format: { with: VALID_EMAIL_REGEX }, 
  	uniqueness: { case_sensitive:false}
  	)
  #validates :password_confirmation,presence: true

  validates :last_name,presence: true, length:{minimum: 2, maximum: 50}
  validates :user_name,presence: true, length:{minimum: 2, maximum: 50}
  validates :city,presence: true, length:{minimum: 2, maximum: 50}
  validates :country,presence: true, length:{minimum: 2, maximum: 50}

end