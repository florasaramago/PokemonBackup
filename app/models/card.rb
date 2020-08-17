class Card < ApplicationRecord
  belongs_to :backup
  has_many :card_contents, dependent: :delete_all
end
