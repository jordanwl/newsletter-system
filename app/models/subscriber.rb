class Subscriber < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :newsletters, through: :subscriptions

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  before_create :generate_url

  def generate_url
    self.unique_url = "newsletters.com/#{('a'..'z').to_a.shuffle[0,5].join}"
  end
end
