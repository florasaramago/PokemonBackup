class BackupJob < ApplicationJob
  def perform(backup)
    backup.process
  end
end
