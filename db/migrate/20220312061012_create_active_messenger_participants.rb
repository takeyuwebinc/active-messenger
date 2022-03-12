class CreateActiveMessengerParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :active_messenger_participants do |t|
      t.references :user, null: false, foreign_key: { to_table: ActiveMessenger.user_class.table_name }
      t.references :chat, null: false, foreign_key: { to_table: :active_messenger_chats }

      t.timestamps

      t.index [:user_id, :chat_id], unique: true
    end
  end
end
