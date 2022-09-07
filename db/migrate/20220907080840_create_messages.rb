class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :text
      t.references :sender, null: false, foreign_key: {to_table: :users}
      t.references :receiver, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
