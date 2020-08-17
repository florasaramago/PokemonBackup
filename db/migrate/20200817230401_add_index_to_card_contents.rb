class AddIndexToCardContents < ActiveRecord::Migration[6.0]
  def change
    add_index :card_contents, [:key, :value]
  end
end
