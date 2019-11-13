class Subscriber < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
end
