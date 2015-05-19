class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string    :email, null: false, default: ""
      t.string    :provider
      t.string    :uid
      t.string    :name

      t.string    :local_username
      t.string    :github_user

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
