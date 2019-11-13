class Subscriber < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :newsletters, through: :subscriptions

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
