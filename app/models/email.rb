class Email < ApplicationRecord
  belongs_to :newsletter

  serialize :times_sent, Array
  validates :content, presence: true
end
