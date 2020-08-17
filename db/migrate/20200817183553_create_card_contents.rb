class CreateCardContents < ActiveRecord::Migration[6.0]
  def change
    create_table :card_contents do |t|
      t.references :card
      t.string :key
      t.string :value
    end
  end
end
