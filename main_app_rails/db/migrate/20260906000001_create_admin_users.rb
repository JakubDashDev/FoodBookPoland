class CreateAdminUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_users do |t|
      t.string :email
      t.string :password_digest
      t.uuid :uuid, null: false, default: -> { "gen_random_uuid()" }

      t.timestamps
    end

    add_index :admin_users, :email, unique: true
    add_index :admin_users, :uuid, unique: true
  end
end
