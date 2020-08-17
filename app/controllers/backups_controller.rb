class BackupsController < ApplicationController
  def index
    @latest_backup = Backup.last
  end

  def create
    backup = Backup.create! status: :pending
    backup.process

    redirect_to root_url, notice: "Backup successfully created"
  end

  def destroy
    backup = Backup.find(params[:id])
    backup.purge

    redirect_to root_url, notice: "Backup successfully purged"
  end
end
