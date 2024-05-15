class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :token, index: { unique: true }, null: false
      t.string :name, null: false
      t.integer :chats_count, default: 0
      t.integer :next_chat_number, default: 1

      t.timestamps
    end
  end
end
