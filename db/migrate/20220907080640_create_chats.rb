class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|

      t.timestamps
    end

    create_table :user_chats do |t|
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.references :chat, null: false, foreign_key: {to_table: :chats}
    end
  end
end
