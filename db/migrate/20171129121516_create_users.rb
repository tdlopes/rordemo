class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email

      t.timestamps
    end
    add_index :users, :email, name: 'users_email_index', unique: true
  end
end
