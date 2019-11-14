class Email < ApplicationRecord
  belongs_to :newsletter

  validates :content, presence: true
end
