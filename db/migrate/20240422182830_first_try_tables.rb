class FirstTryTables < ActiveRecord::Migration[7.1]
  def change

    add_reference :posts, :user, foreign_key: true

    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :post_tags do |t|
      t.belongs_to :post, null: false
      t.belongs_to :tag, null: false

      t.timestamps
    end
    
  end
end
