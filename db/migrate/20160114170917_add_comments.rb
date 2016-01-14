class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :deploy
      t.references :user
    end
  end
end
