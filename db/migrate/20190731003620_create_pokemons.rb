class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.decimal :weight
      t.decimal :height

      t.timestamps
    end
  end
end
