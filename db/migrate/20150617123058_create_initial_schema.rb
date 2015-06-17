class CreateInitialSchema < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text   :description
      t.string :url
      t.string :thumbnail_url

      t.timestamps null: false
    end

    create_table :article_tweets do |t|
      t.integer    :tweet_id, limit: 8, index: true
      t.integer    :user_id, limit: 8, index: true
      t.references :article
      t.datetime   :posted_at
    end
    add_index :article_tweets, [:user_id, :article_id]
  end
end
