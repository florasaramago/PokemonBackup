require "test_helper"

class Backup::ProcessTest < ActiveSupport::TestCase
  test "successful backup" do
    assert_equal "pending", backups(:pending_backup).status

    assert_difference -> { backups(:pending_backup).cards.count }, +100 do
      backups(:pending_backup).process
    end

    assert_equal "processed", backups(:pending_backup).status
  end
end
