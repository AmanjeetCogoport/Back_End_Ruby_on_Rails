class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :passward
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
