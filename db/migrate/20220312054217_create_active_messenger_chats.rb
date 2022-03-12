class CreateActiveMessengerChats < ActiveRecord::Migration[7.0]
  def change
    create_table :active_messenger_chats do |t|
      t.string :type, null: false

      t.timestamps
    end
  end
end
