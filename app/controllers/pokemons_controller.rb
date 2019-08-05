require 'csv'

class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def upload
    csv_path = File.join Rails.root, 'db', 'pokemon.csv'
    PokemonAddWorker.perform_async(csv_path)
    flash[:notice] = "Pokemons getting added to db"
    redirect_to pokemons_path
  end

  def destroy_all
    PokemonRemoveWorker.perform_async
    flash[:notice] = "Pokemons getting removed from db"
    redirect_to pokemons_path
  end

  def clean_up
   # GuestsCleanupJob.perform_later("guest")
    GuestsCleanupJob.set(wait: 10.second).perform_later("guest")
    redirect_to pokemons_path
  end
end
