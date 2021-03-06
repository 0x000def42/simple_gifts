class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gifts_as_autor, class_name: 'Gift', foreign_key: :autor_id
  has_many :gifts_as_recepient, class_name: 'Gift', foreign_key: :recepient_id

  validates :email, uniqueness: true

  def self.get_new email
    User.create(email: email, password: rand(36**16).to_s(36))
  end
end