class AddTopToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :top, :boolean, null: false, default: false
  end
end
