class AddTablePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title #, null: false  (hacer validation en el modelo)
      t.text :content #, null: false  (hacer validation en el modelo)  
      t.datetime :published_at #, null: false (hacer validation en el modelo)
      t.integer :answers_count, default: 0 #, null: false  (hacer validation en el modelo)
      t.integer :likes_count, default: 0 #, null: false  (hacer validation en el modelo)
      t.references :parent_post, foreign_key: {to_table: :posts}

      t.timestamps
    end
  end
end
