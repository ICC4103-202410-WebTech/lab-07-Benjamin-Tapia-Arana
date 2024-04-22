class AddTableUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name #, null: false, default: ''  (hacer validation en el modelo)
      t.string :email #, null: false, default: ''  (hacer validation en el modelo)
      t.string :password #, null: false  (hacer validation en el modelo)
      
      t.timestamps
    end
  end
end
