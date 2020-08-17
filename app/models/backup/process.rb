class Backup::Process
  API_URL = "https://pokemontcg.io/cards?setCode=base4"

  attr_accessor :backup

  def initialize(backup)
    @backup = backup
  end

  def perform_backup
  end
end
