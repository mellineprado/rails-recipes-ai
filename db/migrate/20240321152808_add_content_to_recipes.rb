class AddContentToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :content, :text
  end
end
