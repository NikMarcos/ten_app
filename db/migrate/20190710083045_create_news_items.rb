class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.string :title
      t.string :cover
      t.references :news_category, index: true
      t.string :body

      t.timestamps
    end
  end
end
