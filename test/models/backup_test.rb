require "test_helper"

class BackupTest < ActiveSupport::TestCase
  test "processing a new backup marks it as processed and purges the last processed backup" do
    backup = Backup.create!
    backup.process

    assert_equal "processed", backup.status
    assert_equal "purged", backups(:processed_backup).status
  end

  test "processing a backup adds cards to it" do
    backup = Backup.create!

    assert_difference -> { backup.cards.count }, +100 do
      backup.process
    end
  end

  test "purging a backup destroys its cards" do
    assert_equal 1, backups(:processed_backup).cards.count

    backups(:processed_backup).purge

    assert_equal 0, backups(:processed_backup).cards.count
  end
end
