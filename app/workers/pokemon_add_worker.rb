class PokemonAddWorker < PokemonWorker

  class Error
    def initialize(msg = nil)
      Sidekiq.logger.error "[JY] [sidekiq] #{msg}"
    end
  end

  def perform(csv_path)
    CSV.foreach((csv_path), headers: true) do |pokemon|
      Pokemon.create(name: pokemon[1], height: pokemon[3], weight: pokemon[4])
    end
  rescue  => e
    Rails.logger.debug("[JY] [Rails] error happens")
    #Sidekiq.logger.fatal("[JY] fatal sidekiq")
    raise Error.new(msg = "[JY] Pokemon.create happen error e = #{e}")
  end
end