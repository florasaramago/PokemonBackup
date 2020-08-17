class Backup::Process
  API_URL = "https://api.pokemontcg.io/v1/cards?setCode=base4"

  attr_accessor :backup, :cards

  def initialize(backup)
    @backup = backup
    @cards  = fetch_cards
  end

  def perform_backup
    if @cards.any?
      @cards.each { |card| add_card(card) }
    end
  end

  private
    def fetch_cards
      response = Net::HTTP.get(URI(API_URL))
      json = JSON.parse(response)
      json["cards"]
    rescue
      []
    end

    def add_card(card_data)
      Backup.transaction do
        card = @backup.cards.create! identifier: card_data["id"]

        card_data.each do |key, value|
          card.card_contents.create! key: key, value: value
        end
      end
    end
end
