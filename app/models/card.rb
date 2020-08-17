class Card < ApplicationRecord
  belongs_to :backup
  has_many :card_contents, dependent: :delete_all

  def image_url
    "https://images.pokemontcg.io/base4/#{identifier.gsub("base4-", "")}.png"
  end
end
