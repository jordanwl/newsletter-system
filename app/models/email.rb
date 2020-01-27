class Email < ApplicationRecord
  belongs_to :newsletter
  has_many :email_sents

  validates :content, presence: true
end
