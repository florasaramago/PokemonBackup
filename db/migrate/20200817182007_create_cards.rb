class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :identifier
      t.timestamps
    end
  end
end
