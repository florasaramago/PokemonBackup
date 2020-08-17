require "test_helper"

class BackupsControllerTest < ActionDispatch::IntegrationTest
  test "index without any existing backups" do
    Backup.delete_all

    get backups_url
    assert_response :ok

    assert_select "a", text: "Create Backup", count: 1
    assert_select "a", text: "Purge Backup", count: 0
    assert_select "a", text: "Search Backup", count: 0
  end

  test "index with existing backups" do
    get backups_url
    assert_response :ok

    assert_select "a", text: "Create Backup", count: 1
    assert_select "a", text: "Purge Backup", count: 1
    assert_select "a", text: "Search Backup", count: 1
  end

  test "create" do
    assert_difference -> { Backup.count }, +1 do
      post backups_url
      assert_redirected_to root_url
      assert_equal 100, Backup.last.cards.count
    end
  end

  test "destroy" do
    backups(:pending_backup).process

    assert_difference -> { Card.count }, -100 do
      delete backup_url(backups(:pending_backup))
      assert_redirected_to root_url
    end
  end
end
