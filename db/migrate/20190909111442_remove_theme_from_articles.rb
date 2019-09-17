class RemoveThemeFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :theme, :string
  end
end
