class PokemonWorker
  require 'csv'
  include Sidekiq::Worker
  sidekiq_options retry: false

  class << self
    def initialize
      #Sidekiq::Logging.logger.level = Logger::ERROR
    end
  end
end