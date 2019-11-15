class Subscription < ApplicationRecord
  belongs_to :newsletter
  belongs_to :subscriber

  validates :newsletter_id, presence: true, uniqueness: { scope: :subscriber_id }
  validates :subscriber_id, presence: true

  after_create :subscribe_track
  after_destroy :unsubscribe_track

  def subscribe_track
    SubTracker.create!(
      newsletter_id: self.newsletter.id,
      action: "subscribe")
  end

  def unsubscribe_track
    SubTracker.create!(
      newsletter_id: self.newsletter.id,
      action: "unsubscribe")
  end
end
