class DeviseCreateCraftsmen < ActiveRecord::Migration
  def change
    create_table(:craftsmen) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :craftsmen, :email,                :unique => true
    add_index :craftsmen, :reset_password_token, :unique => true
    # add_index :craftsmen, :confirmation_token,   :unique => true
    # add_index :craftsmen, :unlock_token,         :unique => true
    # add_index :craftsmen, :authentication_token, :unique => true
  end

end
