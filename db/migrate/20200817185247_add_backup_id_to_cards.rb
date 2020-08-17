class AddBackupIdToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :backup_id, :integer
  end
end
