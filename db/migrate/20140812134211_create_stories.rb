class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :message
      t.string :uid
      t.datetime :date
      t.references :deploy

      t.timestamps
    end
  end
end
