class CreateActiveMessengerMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :active_messenger_messages do |t|
      t.references :chat, null: false, foreign_key: { to_table: :active_messenger_chats }
      t.references :participant, null: false, foreign_key: { to_table: :active_messenger_participants }
      t.string :type, null: false
      t.json :payload

      t.timestamps
    end
  end
end
