class Subscription < ApplicationRecord
  belongs_to :newsletter
  belongs_to :subscriber

  validates :newsletter_id, presence: true, uniqueness: { scope: :subscriber_id }
  validates :subscriber_id, presence: true
end
