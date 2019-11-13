class User < ApplicationRecord
  has_secure_password

  has_many :newsletters, dependent: :destroy
  has_many :emails, through: :newsletters

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
