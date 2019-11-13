class Newsletter < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :emails, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
