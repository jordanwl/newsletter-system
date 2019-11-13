class Subscriber < ApplicationRecord
  has_many :subscriptions, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
