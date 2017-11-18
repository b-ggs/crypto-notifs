class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
      t.integer :chat_id
      t.string :first_name
    end
  end
end
