class AddGenreNameToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :genre_name, :string
  end
end
