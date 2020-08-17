require "test_helper"

class CardTest < ActiveSupport::TestCase
  test "has an image url based on its identifier" do
    card = Card.create! identifier: "base4-112", backup: backups(:pending_backup)
    assert_equal "https://images.pokemontcg.io/base4/112.png", card.image_url
  end
end
