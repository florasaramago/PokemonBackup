class Backup < ApplicationRecord
  has_many :cards, dependent: :destroy

  enum status: %i[ pending processed purged ]

  after_create_commit :process_later

  def process
    transaction do
      Backup::Process.perform_backup self
      update! status: :processed
    end
  end

  def purge
    transaction do
      cards.destroy_all
      update! status: :purged
    end
  end

  private
    def process_later
      BackupJob.perform_later self
    end
end
