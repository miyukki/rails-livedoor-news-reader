class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :rss_url
    end

    add_column :articles, :category_id, :integer, after: :id
  end
end
