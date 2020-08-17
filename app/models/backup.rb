class Backup < ApplicationRecord
  has_many :cards, dependent: :destroy

  enum status: %i[ pending processed purged ]

  def process
    transaction do
      purge_last_processed_backup
      perform_backup
      processed!
    end
  end

  def purge
    transaction do
      cards.destroy_all
      purged!
    end
  end

  private
    def perform_backup
      Backup::Process.new(self).perform_backup
    end

    def purge_last_processed_backup
      Backup.processed.last&.purge
    end
end
