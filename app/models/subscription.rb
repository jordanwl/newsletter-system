class Subscription < ApplicationRecord
  belongs_to :newsletter
  belongs_to :subscriber
end
